<?php

namespace app\admin\controller;

use app\common\exception\Failure;
use app\common\exception\Success;
use think\app;
use think\captcha\Captcha;
use think\facade\Config;

class Index extends Base
{
    public function __construct(App $app = null) {
        parent::__construct($app);
    }

    public function index() {

        return $this->fetch();
    }


    public function login() {
        //其他操作
        if ($this->request->isAjax()) {
            $data = $this->request->param();
            $userName = $data['user_name'];
            $passwrod = $data['password'];
            //验证码开启则进行校验
            $showCaptcha = Config::get('show_captcha');
            if($showCaptcha===true){
                $captcha = $data['captcha'];
                $captchaObj=new Captcha();
                $checkResult = $captchaObj->check($captcha);
                if ($checkResult === false) {
                    throw new Failure('验证码错误，请重新输入');
                    exit();
                }
            }
            throw new Success();
            $this->success();


        }

        return $this->fetch();
    }

}