<?php


namespace app\admin\controller;


use think\App;

class Menu extends Base
{
    public function initialize() {
        parent::initialize();
    }
    public function index(){

        return $this->fetch();
    }
}