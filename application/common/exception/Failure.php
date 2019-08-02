<?php

namespace app\common\exception;

use app\common\library\Code;

class Failure extends Base
{
//    $code = '',$msg='',$data=[],$httpCode='',$jumpUrl=''
    public function __construct($msg = "数据请求失败", array $data = [], $jumpUrl = '', $code = Code::REQUEST_ERROR, $httpCode = Code::HTTP_REQUEST_SUCCESS_CODE) {
        parent::__construct($msg, $data, $jumpUrl, $code, $httpCode);

    }
}