<?php


namespace app\common\model;


class Tag extends Base
{
    protected $name = 'tag';
    protected $autoWriteTimestamp = 'datetime';

    public static function getRandTagList($field = 'id,name', $limit = 20) {
        $data = self::where(['status' => 1])->field($field)->orderRand()->limit($limit)->select();
        return $data;
    }
}