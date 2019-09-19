<?php


namespace app\index\controller;


use think\App;
use think\Controller;
use think\facade\Config;

class Base extends Controller
{
    //alioss配置项
    protected $ossConfig = [];

    public function __construct(App $app = null) {
        parent::__construct($app);
        $this->ossConfig = Config::get('alioss');
    }
}