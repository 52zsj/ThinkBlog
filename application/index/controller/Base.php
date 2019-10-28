<?php


namespace app\index\controller;


use app\common\library\Enum;
use app\common\model\Dictionary;
use app\common\model\FrontMenu as FrontMenuModel;
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
    //模型
    protected $model = null;
    //
    public static $weekArray = ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];

    protected $menuId = 1;

    public function initialize() {
        parent::initialize();
        $this->assignSeoData();
        $this->ossConfig = Config::get('alioss');
        //获取网站页脚
        $request = Request::instance();
        $moduleName = $request->module();
        $controllerName = strtolower($request->controller());
        $actionName = strtolower($request->action());
        $config = [
            'moduleName' => $moduleName,
            'controllerName' => $controllerName,
            'actionName' => $actionName,
            'jsName' => 'js/' . str_replace('.', '/', $controllerName),
            'moduleUrl' => rtrim(url("/{$moduleName}", '', false), '/'),
        ];
        $this->assign('week_array', self::$weekArray);
        $this->view->assign('config', $config);
        //获取网站菜单
        $frontMenuList = FrontMenuModel::where('status', 'eq', 1)->order('order_key asc')->select();

        $this->assign('menu_id', $this->menuId);
        $this->assign('front_menu_list', $frontMenuList);
    }

    public function assignConfig($name, $value = '') {
        $this->view->config = array_merge($this->view->config ? $this->view->config : [], is_array($name) ? $name : [$name => $value]);
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