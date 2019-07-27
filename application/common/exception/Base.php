<?php


namespace app\common\exception;

use think\facade\Config;
use think\facade\Log;


class Base extends \Exception
{
    //错误代码
    public $code = '000000';
    //错误消息
    public $msg = '';
    // 返回请求状态码
    public $httpCode;
    public $data;
    // 请求URL
    public $reqUrl;
    public $jumpUrl;
    public function __construct($code = '',$msg='',$data=[],$httpCode='',$jumpUrl='') {
        $this->code = $code;
        $this->msg = $msg;
        $this->httpCode = $httpCode;
        $this->data = $data;
        $this->jumpUrl = $jumpUrl;
        $isDebug = Config::get('app.debug');
        if ($isDebug === true) {
            Log::write("code:" . $code . "####msg:" . $msg . "####data:" . json_encode($data) . "###httpCode:" . $httpCode);
        }

    }
}