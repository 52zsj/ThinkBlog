<?php


namespace app\admin\controller;

use app\common\model\Column as ColumnModel;
use jack\Tree;

class Column extends Base
{
    public function initialize() {
        parent::initialize();
        $this->model = new ColumnModel();
    }

    public function index() {
        //设置过滤方法
        $this->request->filter(['strip_tags']);
        $row = $this->model->select();

        $tree = Tree::instance()->init($row->toArray());
        $htmls = "<tr cate-id='@id' fid='@pid'><td>@id</td> <td><i class=\"layui-icon x-show\" status='true'>&#xe623;</i>@name</td><td>@status</td><td>@order_key</td><td class=\"td-manage\"><a title=\"编辑\" onclick=\"xadmin.open('编辑','edit/id/@id')\" href=\"javascript:;\"><i class=\"layui-icon\">&#xe642;</i></a><a title=\"删除\" class=\"del-data\" data-url=\"del\" data-id=\"@id\" href=\"javascript:;\"><i class=\"layui-icon\">&#xe640;</i></a></td>@childlist";
        $tree = $tree->getTreeUl(0, $htmls, '', '', 'tr');
        $this->assign('tree', $tree);
        // $this->assign('row', $row);
        return $this->fetch();
    }

    public function add() {
        $row = $this->model->where('status', '1')->select();

    }
}