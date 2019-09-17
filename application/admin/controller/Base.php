<?php

namespace app\admin\controller;

use app\admin\logic\Auth;
use app\common\model\Menu;
use jack\Tree;
use think\App;
use think\Controller;
use think\facade\Config;
use think\facade\Session;


class Base extends Controller
{
    //无需登录的方法,同时也就不需要鉴权了
    protected $noNeedLogin = [];
    //无需鉴权的方法,但需要登录
    protected $noNeedRight = [];
    //默认的提示语
    protected $defaultMsg = '欢迎光临LuckLyJack的博客';
    //默认标题
    protected $title = '欢迎光临LuckLyJack的博客';
    //alioss配置项
    protected $ossConfig=[];


    public function __construct(App $app = null) {
        parent::__construct($app);
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
        $this->assign('path',$path);

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
        $menuList = Menu::where('status', '=', '1')->where('is_menu',1)->select()->toArray();
        foreach ($menuList as $k => &$v) {
            $v['url'] = '/' . $moduleName . '/' . $v['url'];
        }
        Tree::instance()->init($menuList);
        $tpl = '<li><a href="javascript:;" onclick="xadmin.add_tab(\'@title\',\'@url\')"><i class="@icon" lay-tips="@title"></i><cite>@title</cite></i></a>@childlist</li>';
        $menu = Tree::instance()->getTreeUl(0, $tpl, '', '', 'ul', 'class="sub-menu"');
        $this->assign('menu', $menu);
        $assignArray=[
            'title'=>$this->title,
            'default_msg'=>$this->defaultMsg,
            'path'=>$path
        ];
        $this->assign($assignArray);
    }
    //需要权限验证

}