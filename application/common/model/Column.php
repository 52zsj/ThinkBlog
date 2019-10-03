<?php


namespace app\common\model;


use jack\Tree;

class Column extends Base
{
    protected $name = 'column';
    protected $autoWriteTimestamp = 'datetime';

    public static function getColumList($where = ['status' => 1], $field = '*', $order = 'order_key asc') {
        $column_list = self::where($where)->order($order)->field($field)->select();
        return $column_list;
    }

    public static function getTreeColumnList($where = ['status' => 1], $field = '*', $order = 'order_key asc', $myid = 0) {
        $data = self::getColumList($where, $field, $order);
        if (empty($data)) {
            return $data;
        }
        $tree = Tree::instance()->init($data)->getTreeArray(0);
        $treeData = Tree::instance()->getTreeList($tree, 'name');
        return $treeData;
    }
}