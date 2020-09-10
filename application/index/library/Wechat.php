<?php
/**
 * Created by PhpStorm.
 * User: 52zsj.com
 * Date: 2020/2/13
 * Time: 10:47
 */

namespace app\index\library;


use fast\Http;

class Wechat
{
    protected $appId = '';
    protected $secret = '';
    private $errorMsg = null;
    private $accessToken = '';


    public function __construct($appId, $secret, $accessToken = '')
    {
        if (empty($appId) || empty($secret)) {
            $this->setErrorMsg('APPID或SECRET不能为空');
            return false;
        }
        $this->appId = $appId;
        $this->secret = $secret;
        $this->accessToken = $accessToken;
    }

    public function accessToken()
    {
        return $this->accessToken;
    }


    /**
     * 获取AccessToken
     */
    public function getAccessToken()
    {
        if (!empty($this->accessToken)) {
            return $this->accessToken;
        }
        $params = [
            'grant_type' => 'client_credential',
            'appid' => $this->appId,
            'secret' => $this->secret,
        ];
        $url = "https://api.weixin.qq.com/cgi-bin/token";
        $ret = Http::sendRequest($url, $params, 'GET');
        if ($ret['ret']) {
            $msg = (array)json_decode($ret['msg'], true);
            if (isset($msg['access_token'])) {
                $token = $msg['access_token'];
                $this->accessToken = $token;
                return $token;
            } else {
                $this->setErrorMsg($msg['errmsg']);
                return false;
            }
        } else {
            $this->setErrorMsg();
            return false;
        }

    }


    /**
     * 创建二维码
     */
    public function createQrCode($sn = '', $params = [])
    {
        $token = self::getAccessToken();
        $url = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token={$token}";
        if (!empty($sn)) {
            $params = [
                'expire_seconds' => 600,
                'action_name' => 'QR_STR_SCENE',
                'action_info' => [
                    'scene' => [
                        'scene_str' => "sn_" . $sn,
                    ]
                ],
            ];
        }
        $result = Http::sendRequest($url, json_encode($params));
        if ($result['ret']) {
            $msg = (array)json_decode($result['msg'], true);
            if (isset($msg['ticket']) && isset($msg['url'])) {
                $imgUrl = "https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=" . urlencode($msg['ticket']);
                $url = $msg['url'];
                return ['img_url' => $imgUrl, 'url' => $url];
            } else {
                $this->setErrorMsg($msg['errormsg']);
                return false;
            }
        } else {
            $this->setErrorMsg();
            return false;
        }
    }

    private function setErrorMsg($msg = '网络异常')
    {
        $this->errorMsg = $msg;
        return $this;
    }

    public function getError()
    {
        return $this->errorMsg;
    }

}