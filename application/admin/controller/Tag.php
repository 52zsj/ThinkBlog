<?php


namespace app\admin\controller;


use  app\common\model\Tag as TagModel;

class Tag extends Base
{

    public function initialize() {
        parent::initialize();
        $this->model = new TagModel();
    }

}