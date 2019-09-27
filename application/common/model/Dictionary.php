<?php


namespace app\common\model;


class Dictionary extends Base
{
    protected $name = 'dictionary';
    protected $autoWriteTimestamp = 'datetime';

    public static function getValueByEnName($enName = '', $field = 'name,en_name,value') {
        $data = [];
        if ($enName) {
            $where = ['status' => 1, 'en_name' => $enName];
            $data = self::where($where)->field($field)->order('order_key', 'asc')->select();
        }
        return $data;
    }

    public static function getValueByGroup($group = '', $field = 'name,en_name,value') {
        $data = [];
        if ($group) {
            $where = ['status' => 1, 'group' => $group];
            $data = self::where($where)->field($field)->order('order_key', 'asc')->select();
        }
        return $data;
    }
}