<?php

namespace app\admin\controller;

use app\admin\logic\Auth;
use app\common\model\Menu;
use lucklyjack\Tree;
use think\App;
use think\Controller;
use think\Db;
use think\facade\Session;
use think\model\Collection;


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


    public function __construct(App $app = null) {
        parent::__construct($app);

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
        $menu = Tree::instance()->getTreeByXadmin(0, $tpl, '', '', 'ul', 'class="sub-menu"');
        $this->assign('menu', $menu);
        $assignArray=[
            'title'=>$this->title,
            'default_msg'=>$this->defaultMsg,
            'path'=>$path
        ];
        $this->assign($assignArray);
    }
    //需要权限验证

    /**
     * 递归获取子级元素
     * function getChilds
     * By Jay  Date: 2018/8/19
     * @param $data
     * @param int $pid
     * @return array
     */
    protected function getChilds($data, $pid = 0) {
        $arr = [];
        if ($data) {
            foreach ($data as $v) {
                if ($v['pid'] == $pid) {
                    $v['child'] = $this->getChilds($data, $v['id']);
                    $arr[] = $v;
                }
            }
            return $arr;
        }
        return $data;
    }

    /*
     * <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="">&#xe6b8;</i>
                    <cite>会员管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('统计页面','welcome1.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>统计页面</cite></a>
                    </li>
                </ul>
      </li>
     * */
    public function createMenum($treeList) {
        $html = '<li>';
        foreach ($treeList as $k => $v) {
            if ($v['pid'] == 0 && empty($v['child'])) {
                $html .= ' <a href="javascript:;"><i class="iconfont left-nav-li" lay-tips="">&#xe6b8;</i> <cite>' . $v['title'] . '</cite> <i class="iconfont nav_right">&#xe697;</i></a></li>';
            } elseif ($v['pid'] == 0 && !empty($v['child'])) {
                $html .= '<a href="javascript:;"><i class="iconfont left-nav-li" lay-tips="">&#xe6b8;</i> <cite>' . $v['title'] . '</cite> <i class="iconfont nav_right">&#xe697;</i></a><ul class="sub-menu"><li> <a onclick="xadmin.add_tab(\'' . $v['title'] . '\',\'' . $v['rule'] . '\')"><i class="iconfont">&#xe6a7;</i><cite>' . $v['title'] . '</cite></a></li>';
            }
            $html .= '</ul>';
        }
        $html .= '</li>';
        return $html;
    }
}