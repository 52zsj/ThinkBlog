<?php
/**
 * Created by PhpStorm.
 * User: 52zsj.com
 * Date: 2020/2/17
 * Time: 9:17
 */

namespace app\index\controller;


use think\facade\Log;

class Wechat extends Base
{


    public function test()
    {
        $ThinkRequest = $this->request->param();
        Log::write($ThinkRequest, 'debug');
        Log::write('原生PHP格式取值：', 'debug');
        $data = file_get_contents('php://input');
        Log::write($data, 'debug');
    }

}