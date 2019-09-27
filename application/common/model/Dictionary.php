<?php


namespace app\common\model;


class Dictionary extends Base
{
    protected $name = 'dictionary';
    protected $autoWriteTimestamp = 'datetime';

    /**
     * 通过名称获取value值
     * @param string $enName 英文名称
     * @param string $field 字段
     * @return array|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getValueByEnName($enName = '', $field = 'name,en_name,value') {
        $data = [];
        if ($enName) {
            $where = ['status' => 1, 'en_name' => $enName];
            $data = self::where($where)->field($field)->order('order_key', 'asc')->select();
        }
        return $data;
    }

    /**
     * 通过分组获取数据
     * @param string $group 分组名
     * @param string $field 字段
     * @return array|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getValueByGroup($group = '', $field = 'name,en_name,value') {
        $data = [];
        if ($group) {
            $where = ['status' => 1, 'group' => $group];
            $data = self::where($where)->field($field)->order('order_key', 'asc')->select();
        }
        return $data;
    }
}