<?php


namespace app\common\model;


class ArticleTags extends Base
{
    protected $name = 'article_tag';

    public function tagList() {
        return $this->belongsTo('app\common\model\Tag', 'tag_id', 'id');
    }
    public function articleList(){
        return $this->belongsTo('app\common\model\Article', 'article_id', 'id');
    }
}