<?php


namespace app\index\controller;

use app\common\model\Article as ArticleModel;
use app\common\model\ArticleTags as ArticleTagsModel;
use app\common\model\Tag as TagModel;

class Article extends Base
{
    public function initialize() {
        parent::initialize();
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
        /*获取文章的上一篇 和下一篇*/
        $infoField = 'id,title';
        $nextInfo = ArticleModel::where('status', 'eq', '1')->where('id', '>', $articleId)->field($infoField)->order('id asc')->limit(1)->find();

        $preInfo = ArticleModel::where('status', 'eq', '1')->where('id', '<', $articleId)->field($infoField)->order('id desc')->limit(1)->find();

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

        $tags = $articleInfo['tags'];

        $data['title'] = $articleInfo['title'];
        $data['webKeywords'] = $articleInfo['title'];
        $data['webDescription'] = $articleInfo['description'];
        $this->assignSeoData($data);
        $assignArray = [
            'next' => $nextInfo,
            'pre' => $preInfo,
            'article_info' => $articleInfo,
            'tags' => $tags,
        ];
        $this->assign($assignArray);
        return $this->fetch();
    }

    public function tagList() {
        $tagId = $this->request->param('tag_id');
        if (!$tagId) {
            $this->error('异常操作');
        }
        $taginfo = TagModel::where('status', 'eq', 1)->value('name');
        if (empty($taginfo)) {
            $this->error('该标签已被停用');
        }
        $articleList = ArticleTagsModel::where('tag_id', 'eq', $tagId)->with(['articleList' => function ($query) {
            $query->field('id,title,cover,description')->where('status', 'eq', 1)->order('order_key asc , create_time desc')->limit(10);
        }])->select();

        if (!empty($articleList)) {
            $articleList = array_chunk($articleList->toArray(), 2);
        }
        $assignArray = [
            'article_list' => $articleList,
        ];
        $this->assign($assignArray);
        return $this->fetch();

    }
}