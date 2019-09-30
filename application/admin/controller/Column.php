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



}