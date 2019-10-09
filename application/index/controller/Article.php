<?php


namespace app\index\controller;

use app\common\model\Article as ArticleModel;

class Article extends Base
{
    public function initialize() {
        parent::initialize();
    }

    public function detail() {
        $articleId = $this->request->param('article_id');
        if (!$articleId) {
            $this->error('文章错误');
        }
        $where[] = ['id', 'eq', $articleId];
        $where[] = ['status', 'eq', 1];
        /*获取文章的上一篇 和下一篇*/

        $infoField='id,title';
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
}