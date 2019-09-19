<?php


namespace app\index\controller;


use think\App;

class Album extends Base
{
    public function __construct(App $app = null) {
        parent::__construct($app);
    }

    public function index() {
        //首页吧
        return $this->fetch();
    }
}