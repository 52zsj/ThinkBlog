<?php
namespace app\admin\controller;
use think\Controller;
use think\App;

class Base extends Controller
{
    public function __construct(App $app = null) {
        parent::__construct($app);
    }
    //需要权限验证
}