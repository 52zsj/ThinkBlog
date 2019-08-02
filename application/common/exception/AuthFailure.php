<?php

namespace app\common\exception;

use app\common\library\Code;

class AuthFailure extends Base
{
    public function __construct($msg = "无权使用", array $data = [], $jumpUrl = '', $code = Code::AUTH_FAILURE, $httpCode=Code::HTTP_REQUEST_SUCCESS_CODE) {
        parent::__construct($msg, $data, $jumpUrl, $code, $httpCode);
    }
}