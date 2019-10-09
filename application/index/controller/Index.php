<?php

namespace app\index\controller;

use app\common\exception\Failure;
use app\common\exception\Success;
use app\common\library\Enum;
use app\common\model\Album as AlbumModel;
use app\common\model\Article as ArticleModel;
use app\common\model\ArticleTags;
use app\common\model\Banner as BannerModel;
use app\common\model\Dictionary;
use app\common\model\Inspirational;

class Index extends Base
{
    protected $pageSize = 5;

    public function initialize() {
        parent::initialize();
    }

    public function index() {
        $where[] = ['status', 'eq', 1];
        //友情链接？？丢一边去
        $friendlyLink = Dictionary::getValueByGroup(Enum::DIDCTIONARY_FRIENDLY_LINK);
        //鸡汤
        $inspirational = Inspirational::order('create_time', 'desc')->value('content');
        //轮播图
        $bannerList = BannerModel::where($where)->field('id,cover,link,title,description')->order('order_key asc')->limit(10)->select();
        //取出最新5条
        $row = ArticleModel::where($where)->with(['tags' => function ($query) {
            $query->with(['tagList' => function ($query) {
                $query->field('name,id');
            }]);
        }])->field('id,title,cover,content,description,create_time,watch_count')->order('create_time', 'desc')->limit(5)->select();

        //标签云
        $tagCloud = ArticleTags::with(['tagList' => function ($query) {
            $query->field('name,id');
        }])->field('count(*) as total,tag_id')->group('tag_id')->select();

        //处理标签
        $assignArray = [
            'row' => $row,
            'inspirational' => $inspirational,
            'banner_list' => $bannerList,
            'friendly_link' => $friendlyLink,
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
            if (!empty($keyword)) {
                $where[] = ['title|content', 'like', '%' . $keyword . '%'];
            }
            //文章总数
            $articleTotal = ArticleModel::where($where)->count();
            $row = ArticleModel::where($where)->field('id,title,cover,content,description,create_time,watch_count')->with(['tags' => function ($query) {
                $query->with(['tagList' => function ($query) {
                    $query->field('name,id');
                }]);
            }])->page($offset, $limit)->select();
            foreach ($row as $k => &$v) {
                $v['detail_url'] = url('index/article/detail', ['article_id' => $v['id']]);
            }
            unset($v);
            throw new Success('加载成功', ['row' => $row, 'total' => $articleTotal, 'limit' => $limit]);
        }
    }
}
