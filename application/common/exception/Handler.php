<?php


namespace app\common\exception;

use think\exception\Handle;
use think\facade\Log;
use think\facade\Request;
use think\facade\Response;

use app\common\library\Code;

class Handler extends Handle
{
    public function render(\Exception $e) {
        // 参数验证错误
        if ($e instanceof Base) {
            // 如果是 Base类型的则返回相应的数据
            return $this->resData($e->code, $e->msg, $e->data, $e->httpCode, $e->jumpUrl);
        } else {
            // 记录异常日志
            Log::record("未知异常:" . $e->getMessage(), 'error');
            // 未知异常
            return $this->resData(Code::UNKNOWN_EXCEPTION, '未知异常', '', Code::HTTP_REQUEST_ERROR_CODE);
        }
    }

    protected function resData($code, $msg, $data, $httpCode = 200, $jumpUrl = "") {
        $resData = [
            'code' => $code,
            'msg' => $msg,
            'data' => $data,
            'jump_url' => $jumpUrl,
            'request_url' => Request::instance()->url()
        ];
        return Response::create($resData, 'json', $httpCode);
    }
}