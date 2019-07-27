<?php


namespace app\common\exception;


use app\common\library\Code;

class Success extends Base
{
    public function __construct($msg = "数据请求成功", array $data = [], $jumpUrl = '', $code = Code::REQUEST_SUCCESS, $httpCode = Code::HTTP_REQUEST_SUCCESS_CODE) {
        parent::__construct($code, $msg, $data, $httpCode, $jumpUrl);
    }
}