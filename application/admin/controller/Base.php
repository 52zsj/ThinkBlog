<?php

namespace app\admin\controller;

use app\admin\logic\Auth;
use app\common\exception\AuthFailure;
use think\Controller;
use think\App;
use think\exception\HttpException;
use think\facade\Env;
use think\facade\Session;


class Base extends Controller
{
    /**
     * 无需登录的方法,同时也就不需要鉴权了
     * @var array
     */
    protected $noNeedLogin = [];

    /**
     * 无需鉴权的方法,但需要登录
     * @var array
     */
    protected $noNeedRight = [];

    public function __construct(App $app = null) {
        parent::__construct($app);
        Session::set('admin_info',[11111]);
        //当前模块
        $moduleName = $this->request->module();
        //控制器
        $controllerName = strtolower($this->request->controller());
        //方法
        $actionName = strtolower($this->request->action());

        $path =str_replace('.', '/', $controllerName) . '/' . $actionName;


        $auth = Auth::instance();
        //先验证当前是否需要登录
        if(!$auth->verify($this->noNeedLogin)){
            //是否已处于登录状态
            if($auth->isLogin()===false){
                //记录的跳转URL
                $url = Session::get('referer');
                $url = $url ? $url : $this->request->url();
                if($url=='/'){
                    $this->redirect('index/login',[],302,['url'=>$url]);
                }
                $this->error('请登录后在操作!','index/login',['url'=>$url]);
//                throw new AuthFailure('请先登录后在操作',['url'=>$url],'index/login');
            }
        }
        //在验证是否需要判断权限
    }
    //需要权限验证
}