<?php
namespace app\admin\controller;

use think\Request;

class Index extends Base
{
    public function __construct(\think\App $app = null) {
        parent::__construct($app);
    }

    public function index() {


        return $this->fetch();
    }
    public function welcome(){
        return $this->fetch();
    }
}