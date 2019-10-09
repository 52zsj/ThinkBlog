<?php


namespace app\common\model;


class Article extends Base
{
    protected $name='article';
    protected $autoWriteTimestamp = 'datetime';

    public function tags(){
        return $this->hasMany('app\common\model\ArticleTags', 'article_id', 'id');
    }
    public function column(){
        return $this->hasOne('app\common\model\Column','id','column_id');
    }

}