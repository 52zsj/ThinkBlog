<?php

namespace app\admin\controller;

use app\admin\library\traits\Backend;
use app\admin\logic\Auth;
use app\common\model\Menu;
use jack\Tree;
use think\App;
use think\Controller;
use think\facade\Config;
use think\facade\Env;
use think\facade\Request;
use think\facade\Session;


class Base extends Controller
{
    //无需登录的方法,同时也就不需要鉴权了
    protected $noNeedLogin = [];
    //无需鉴权的方法,但需要登录
    protected $noNeedRight = [];
    //默认的提示语
    protected $defaultMsg = '欢迎光临张世杰的博客';
    //默认标题
    protected $title = '张世杰的博客';
    //alioss配置项
    protected $ossConfig = [];
    //上传文件存放区域
    protected $uploadPath = 'upload' . DIRECTORY_SEPARATOR;
    //根目录
    protected $rootPath;
    //模型
    protected $model=null;
    //引入
    use Backend;
    // protected $middleware = [
    //     'auth_check' => ['except', ['login']],
    // ];
    public function initialize() {
        //根目录
        $this->rootPath = Env::get('root_path');
        //oss配置项
        $this->ossConfig = Config::get('alioss');
        //当前模块
        $moduleName = $this->request->module();
        //控制器
        $controllerName = strtolower($this->request->controller());
        //方法
        $actionName = strtolower($this->request->action());
        //完整路径
        $path = str_replace('.', '/', $controllerName) . '/' . $actionName;
        $this->assign('path', $path);

        $auth = Auth::instance();
        //先验证当前是否需要登录
        if (!$auth->verify($this->noNeedLogin)) {
            //是否已处于登录状态
            if ($auth->isLogin() === false) {
                //记录的跳转URL
                $url = Session::get('referer');
                $url = $url ? $url : $this->request->url();
                if ($url == '/') {
                    $this->redirect('index/login', [], 302, ['url' => $url]);
                }
                $this->error('请登录后在操作!', 'index/login', ['url' => $url]);
            }
        }
        //在验证是否需要判断权限


        //获取所有权限菜单
        $menuList = Menu::where('status', '=', '1')->where('is_menu', 1)->select()->toArray();
        foreach ($menuList as $k => &$v) {
            $v['url'] = '/' . $moduleName . '/' . $v['url'];
        }
        Tree::instance()->init($menuList);
        $tpl = '<li><a href="javascript:;" onclick="xadmin.add_tab(\'@title\',\'@url\')"><i class="@icon" lay-tips="@title"></i><cite>@title</cite></i></a>@childlist</li>';
        $menu = Tree::instance()->getTreeUl(0, $tpl, '', '', 'ul', 'class="sub-menu"');
        $this->assign('menu', $menu);
        $assignArray = [
            'title' => $this->title,
            'default_msg' => $this->defaultMsg,
            'path' => $path
        ];
        $this->assign($assignArray);
        $config = [
            'moduleName' => $moduleName,
            'controllerName' => $controllerName,
            'actionName' => $actionName,
            'jsName' => 'js/' . str_replace('.', '/', $controllerName),
            'moduleUrl' => rtrim(url("/{$moduleName}", '', false), '/'),
        ];
        $this->view->assign('config', $config);
    }

    public function assignConfig($name, $value = '') {
        $this->view->config = array_merge($this->view->config ? $this->view->config : [], is_array($name) ? $name : [$name => $value]);
    }


    //需要权限验证

}