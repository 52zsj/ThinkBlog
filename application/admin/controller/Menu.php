<?php


namespace app\admin\controller;


use think\App;

class Menu extends Base
{
    public function __construct(App $app = null) {
        parent::__construct($app);
    }
    public function index(){

        return $this->fetch();
    }
}