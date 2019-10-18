<?php


namespace app\admin\controller;

use app\common\model\Menu as MenuModel;
use jack\Tree;

class Menu extends Base
{
    public function initialize() {
        parent::initialize();
        $this->model = new MenuModel();
        $column_list = $this->model->where('status', 'eq', 1)->select();
        $list = Tree::instance()->getTreeList(Tree::instance()->init($column_list, 'pid', 'id')->getTreeArray(0), 'title');
        $list = array_column($list, 'title', 'id');
        $this->assign('list', $list);
    }

    /**
     * 查看
     */
    public function index() {
        //设置过滤方法
        $this->request->filter(['strip_tags']);
        if ($this->request->isAjax()) {
            $page = $this->request->param('page', 1);
            $limit = $this->request->param('limit', 10);
            $count = $this->model->count();
            $row = $this->model->select();
            $data['code'] = 0;
            $data['msg'] = '';
            $data['count'] = $count;
            $data['data'] = $row;
            return json($data);
        }
        return $this->fetch();
    }

}