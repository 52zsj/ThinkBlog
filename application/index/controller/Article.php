<?php


namespace app\index\controller;

use app\common\exception\Failure;
use app\common\exception\Success;
use app\common\model\Article as ArticleModel;
use app\common\model\ArticleLike as ArticleLikeModel;
use app\common\model\ArticleTags as ArticleTagsModel;
use app\common\model\Column as ColumnModel;
use app\common\model\Tag as TagModel;
use app\index\logic\Widget as WidgetLogic;
use think\Db;
use think\Exception;

class Article extends Base
{
    protected $pageSize = 8;

    public function initialize() {
        parent::initialize();
    }

    public function articleList() {
        $this->assign('menu_id', 2);
        WidgetLogic::inspirational();
        WidgetLogic::hotArticle();
        WidgetLogic::tagCloud();
        $columnList = ColumnModel::where('status', 'eq', 1)->order('status asc')->field('id,name')->select();
        if ($this->request->isAjax()) {
            $offset = $this->request->param('offset');
            $columnId = $this->request->param('column_id');
            $where[] = ['column_id', 'eq', $columnId];
            $where[] = ['status', 'eq', 1];
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
                }])->field('id,title,cover,content,description,create_time,watch_count,column_id,author')->order('order_key asc ,watch_count dec,like desc, create_time desc')->page($offset, 5)->select();
                foreach ($row as $k => &$v) {
                    $v['detail_url'] = url('index/article/detail', ['article_id' => $v['id']]);
                    $v['publish_time'] = date("Y-m-d", strtotime($v['create_time']));

                }
                unset($v);
            }
            throw new Success('请求成功', ['row' => $row, 'total' => $articleTotal, 'limit' => 5]);
        }
        $this->assignConfig('article_list_url', url('index/article/articleList'));
        $this->assign('column_list', $columnList);
        $this->assignConfig('request_url', url('index/index/search'));
        return $this->fetch();
    }

    /**
     * 文章详情
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function detail() {
        $articleId = $this->request->param('article_id');
        if (!$articleId) {
            $this->error('文章错误');
        }
        $where[] = ['id', 'eq', $articleId];
        $where[] = ['status', 'eq', 1];
        $articleInfo = ArticleModel::with(['tags' => function ($query) {
            $query->with(['tagList' => function ($query) {
                $query->field('name,id');
            }]);
        }, 'column' => function ($query) {
            $query->field('name,id');
        }])->field('id,title,description,content,like,dislike,create_time,author,watch_count,column_id')->where($where)->find();

        if (empty($articleInfo)) {
            $this->error('文章已被删除或已下架');
        }
        $articleInfo->setInc('watch_count');

        $tags = $articleInfo['tags'];
        /*获取文章的上一篇 和下一篇*/
        $infoField = 'id,title';
        $nextInfo = ArticleModel::where('status', 'eq', '1')->where('id', '>', $articleId)->field($infoField)->order('id asc')->limit(1)->find();

        $prevInfo = ArticleModel::where('status', 'eq', '1')->where('id', '<', $articleId)->field($infoField)->order('id desc')->limit(1)->find();
        WidgetLogic::inspirational();
        WidgetLogic::hotArticle();
        WidgetLogic::tagCloud();
        //相关推荐
        $likeArticle = ArticleModel::where('column_id', 'eq', $articleInfo['column_id'])->field('id,title,cover')->limit(6)->select();
        $this->assign('like_article', $likeArticle);
        $data['title'] = $articleInfo['title'];
        $data['webKeywords'] = $articleInfo['title'];
        $data['webDescription'] = $articleInfo['description'];
        $this->assignSeoData($data);
        $assignArray = [
            'next' => $nextInfo,
            'prev' => $prevInfo,
            'article_info' => $articleInfo,
            'tags' => $tags,
        ];
        $this->assign($assignArray);
        $this->assignConfig('like_url', url('index/article/likeArtilce'));
        return $this->fetch();
    }

    /**
     * 标签对应的文章列表
     * @return mixed
     * @throws Failure
     * @throws Success
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function tagList() {
        $tagId = $this->request->param('tag_id');
        if (!empty($tagId) && !is_numeric($tagId)) {
            $this->error('参数异常');
        }
        WidgetLogic::inspirational();
        WidgetLogic::hotArticle();
        if ($this->request->isAjax()) {
            $offset = $this->request->param('offset');
            $taginfo = TagModel::where('status', 'eq', 1)->value('name');
            if (empty($taginfo)) {
                throw new Failure('该标签已被停用了~', '', url('index/index/index'));
            }
            $where[] = ['tag_id ', 'eq', $tagId];
            //总数
            $articleTotal = ArticleTagsModel::where($where)->with(['articleList' => function ($query) {
                $query->where('status', 'eq', 1);
            }])->count();

            $articleList = ArticleTagsModel::where($where)->with(['articleList' => function ($query) {
                $query->field('id,title,cover,description')->where('status', 'eq', 1)->order('order_key asc , create_time desc');
            }])->page($offset, $this->pageSize)->select();
            //处理url
            foreach ($articleList as $k => &$v) {
                $v['detail_url'] = url('index/article/detail', ['article_id' => $v['article_id']]);
            }

            throw new Success('请求成功', ['row' => $articleList, 'total' => $articleTotal, 'limit' => $this->pageSize, 'info' => $taginfo]);

        }

        $this->assignConfig('request_url', url('index/article/tagList', ['tag_id' => $tagId]));
        return $this->fetch();

    }

    /**
     * 点赞
     * @throws Failure
     * @throws Success
     */
    public function likeArtilce() {
        if ($this->request->isAjax()) {
            $articleId = $this->request->param('article_id');
            $ipAddr = $this->request->ip(1);
            $where = ['ip' => $ipAddr, 'article_id' => $articleId];
            $likeCount = ArticleLikeModel::where($where)->whereTime('create_time', 'today')->count();
            if ($likeCount >= 3) {
                throw new Failure('每日最多可点赞3次,请明天再试');
            }

            $articleLikeData = ['ip' => $ipAddr, 'article_id' => $articleId];

            Db::startTrans();
            try {
                ArticleModel::where('id', 'eq', $articleId)->setInc('like');
                ArticleLikeModel::create($articleLikeData);
                $remain = 3 - ($likeCount + 1);
                Db::commit();
            } catch (Exception $e) {
                Db::rollback();
                throw new Failure('每日最多可点赞3次,请明天再试');
            }
            throw new Success('感谢您的支持,您今日还可点赞（' . $remain . '）次');
        }
    }
}