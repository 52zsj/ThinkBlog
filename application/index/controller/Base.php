<?php


namespace app\index\controller;


use think\App;
use think\Controller;
use think\facade\Config;
use think\facade\Request;

class Base extends Controller
{
    //alioss配置项
    protected $ossConfig = [];
    //默认网站关键字
    protected $webKeywords = '个人博客,博客';
    //默认网站说明
    protected $webDescription = '我是一个小菜鸟，整天就知道到敲代码的菜鸟';

    public function __construct(App $app = null) {
        parent::__construct($app);
        $this->assignSeoData();
        $this->ossConfig = Config::get('alioss');
        $request = Request::instance();
        $moduleName = $request->module();
        $controllerName = $request->controller();
        $actionName = $request->action();
        $config = [
            'moduleName' => $moduleName,
            'controllerName' => $controllerName,
            'actionName' => $actionName,
            'jsName' => 'js/' . str_replace('.', '/', $controllerName),
            'moduleUrl' => rtrim(url("/{$moduleName}", '', false), '/'),
        ];
        $this->view->assign('config', $config);
    }

    public function assignConfig() {

    }

    /**
     * 将seo数据提交到前台
     * @param array $data
     */
    public function assignSeoData($data = []) {
        $keywords = isset($data['webKeywords']) && !empty($data['webKeywords']) ? $data['webKeywords'] : $this->webKeywords;
        $description = isset($data['webDescription']) && !empty($data['webDescription']) ? $data['webDescription'] : $this->webDescription;
        $title = isset($data['title']) && !empty($data['title']) ? $data['title'] : '博客';
        $assign_array = ['webKeywords' => $keywords, 'webDescription' => $description, 'title' => $title];
        $this->assign($assign_array);
    }
}