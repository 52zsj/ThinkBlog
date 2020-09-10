<?php

namespace app\index\controller;


use think\facade\Log;

class Verify
{
    public function verifyCode()
    {
        //1. 将timestamp , nonce , token 按照字典排序
        $timestamp = $_GET['timestamp'];
        $nonce = $_GET['nonce'];
        $token = "zsj";
        $signature = $_GET['signature'];
        $array = array($timestamp, $nonce, $token);
        sort($array);

//2.将排序后的三个参数拼接后用sha1加密
        $tmpstr = implode('', $array);
        $tmpstr = sha1($tmpstr);

//3. 将加密后的字符串与 signature 进行对比, 判断该请求是否来自微信
        if ($tmpstr == $signature) {
            echo $_GET['echostr'];
            exit;
        }
    }

    public function test()
    {
        Log::write('face','debug');
        $appid = 'wxde098e7551644844';
        $secret = 'ef37fe3cdd65120659ddc38eb5fbce41';
        $wechat = new \app\index\library\Wechat($appid, $secret);
        $token = $wechat->getAccessToken();
        Log::write('token', 'debug');
        Log::write($token, 'debug');
        dump($token);
        exit();
    }

}