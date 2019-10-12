<?php


namespace app\admin\controller;

use  app\common\model\FrontMenu as FrontMenuModel;

class FrontMenu extends Base
{
    public function initialize() {
        parent::initialize();
        $this->model = new FrontMenuModel();
    }
}