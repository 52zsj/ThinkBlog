<?php

namespace app\admin\controller;

use app\admin\logic\Auth;
use app\common\exception\Failure;
use app\common\exception\Success;
use think\app;
use think\captcha\Captcha;
use think\facade\Config;
use think\facade\Cookie;
use think\facade\Session;
use think\facade\Validate;

class Index extends Base
{
    //不需要登录也就不需要在做权限校验
    protected $noNeedLogin = ['login'];


    public function __construct(App $app = null) {
        parent::__construct($app);
    }

    public function index() {

        return $this->fetch();
    }


    /**
     * 登陆
     * @return mixed
     * @throws Failure
     * @throws Success
     */
    public function login() {
        //其他操作
        $auth = Auth::instance();
        $isLogin = $auth->isLogin();
        if ($isLogin) {
            $this->error('您已登录请勿重复登陆', 'index');
        }
        if ($this->request->isAjax()) {
            $data = $this->request->param();
            $userName = $data['user_name'];
            $passwrod = $data['password'];
            if (empty($userName)) {
                throw new Failure('用户名不能为空');
            }
            if (empty($passwrod)) {
                throw new Failure('密码不能为空');
            }
            //验证码开启则进行校验
            $showCaptcha = Config::get('show_captcha');
            if ($showCaptcha === true) {
                $captcha = $data['captcha'];
                $captchaObj = new Captcha();
                $checkResult = $captchaObj->check($captcha);
                if ($checkResult === false) {
                    throw new Failure('验证码错误，请重新输入');
                }
            }

            $result = $auth->login($userName, $passwrod);
            if ($result === true) {
                throw new Success('登陆成功', [], 'index/index');
            }

        }

        return $this->fetch();
    }

    /**
     * 注销登录
     */
    public function logout() {
        Session::delete('admin_info');
        $this->success('注销成功！', 'index/login');
    }

}