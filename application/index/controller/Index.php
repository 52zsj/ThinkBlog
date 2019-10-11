<?php

namespace app\index\controller;

use app\common\exception\Success;
use app\common\model\Article as ArticleModel;
use app\common\model\ArticleTags;
use app\common\model\Banner as BannerModel;
use app\index\logic\Widget as WidgetLogic;

class Index extends Base
{
    protected $pageSize = 5;

    public function initialize() {
        parent::initialize();
    }

    public function index() {
        $where[] = ['status', 'eq', 1];
        //轮播图
        $bannerList = BannerModel::where($where)->field('id,cover,link,title,description')->order('order_key asc')->limit(10)->select();
        //取出最新5条
        $row = ArticleModel::where($where)->with(['tags' => function ($query) {
            $query->with(['tagList' => function ($query) {
                $query->field('name,id');
            }]);
        }, 'column' => function ($query) {
            $query->field('name,id');
        }])->field('id,title,cover,content,description,create_time,watch_count,column_id,author')->order('create_time', 'desc')->limit(5)->select();
        //标签云
        $tagCloud = ArticleTags::with(['tagList' => function ($query) {
            $query->field('name,id');
        }])->field('count(*) as total,tag_id')->group('tag_id')->select();

        WidgetLogic::inspirational();
        WidgetLogic::hotArticle();
        WidgetLogic::likeArticle();
        WidgetLogic::tagCloud();

        $assignArray = [
            'row' => $row,
            'banner_list' => $bannerList,
            'tag_cloud' => $tagCloud,
        ];

        $this->assign($assignArray);
        $this->assignConfig('request_url', url('index/index/search'));
        return $this->fetch();
    }

    /**
     * 搜索
     * @throws Success
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function search() {
        if ($this->request->isAjax()) {
            $offset = $this->request->param('offset');
            $keyword = $this->request->param('keyword');
            $limit = $this->pageSize;
            $where[] = ['status', '=', 1];
            $where[] = ['title|content', 'like', '%' . $keyword . '%'];
            //文章总数
            $articleTotal = ArticleModel::where($where)->count();
            $row = [];
            if ($articleTotal > 0) {
                $row = ArticleModel::where($where)->field('id,title,cover,content,description,create_time,watch_count,column_id,author')->with(['tags' => function ($query) {
                    $query->with(['tagList' => function ($query) {
                        $query->field('name,id');
                    }]);
                }, 'column' => function ($query) {
                    $query->field('name,id');
                }])->field('id,title,cover,content,description,create_time,watch_count,column_id,author')->order('order_key asc ,watch_count dec,like desc, create_time desc')->page($offset, $limit)->select();
                foreach ($row as $k => &$v) {
                    $v['detail_url'] = url('index/article/detail', ['article_id' => $v['id']]);
                    $v['publish_time'] = date('Y-m-d', strtotime($v['create_time']));
                }
                unset($v);
            }
            throw new Success('加载成功', ['row' => $row, 'total' => $articleTotal, 'limit' => $limit]);
        }
    }
}
