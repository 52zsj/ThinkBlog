<?php


namespace app\admin\logic;


use app\common\exception\Failure;
use app\common\exception\Success;
use OSS\Core\OssException;
use OSS\OssClient;

class Oss
{
    protected static $instance = null;
    protected $rules = [];
    protected $bucket = '';
    protected $accessKeyID = '';
    protected $accessKeySecret = '';
    protected $endPoint = '';
    protected $isCName = false;
    protected $securityToken = NULL;
    protected $requestProxy = NULL;

    protected $error = '';

    public function __clone() {
        // TODO: 禁止clone
    }


    public function __construct($optoin = []) {
        $result = self::setConfig($optoin);
        if ($result === false) {
            throw new Failure($this->getError());
        }
        try {
            $this->ossObj = new OssClient($this->accessKeyID, $this->accessKeySecret, $this->endPoint, $this->isCName, $this->securityToken, $this->requestProxy);
        } catch (OssException $e) {
            throw new Failure($e->getErrorMessage());
        }
    }

    public static function instance($options = []) {
        if (is_null(self::$instance)) {
            self::$instance = new static($options);
        }
        return self::$instance;
    }

    //设置config
    private function setConfig($ossList) {
        if (empty($ossList['accessKeyId']) || empty($ossList['accessKeySecret']) || empty($ossList['endpoint']) || empty($ossList['bucket'])) {
            $this->setError('参数错误');
            return false;
        }
        $this->accessKeyID = $ossList['accessKeyId'];
        $this->accessKeySecret = $ossList['accessKeySecret'];
        $this->endPoint = $ossList['endpoint'];
        $this->bucket = $ossList['bucket'];
        $this->isCName = false;
        $this->securityToken = NULL;
        $this->requestProxy = NULL;
    }

    //上传
    public function uploadToOss($rootPath, $saveName, $unlink = true) {
        $file = $rootPath  . $saveName;
        try {
            $uploadInfo = $this->ossObj->uploadFile($this->bucket, $saveName, $file);
            $data['ossUrl'] = '';
            $data['localUrl'] = $saveName;
            if (!empty($uploadInfo) && $uploadInfo['info']['http_code'] == 200) {
                $data['ossUrl'] = $uploadInfo['info']['url'];
                if ($unlink == true) {
                    //删除本地文件  需要先释放$info 因为它正在占用文件 所以导致无法删除
                    if (file_exists($file)) {
                        unlink($file);
                    }
                }
                return $data;
            }
            throw new Failure('上传失败');
        } catch (OssException $e) {
            throw new Failure($e->getMessage());
        }
    }
    //获取url
    public function getFileUrl($object, $timeOut = 3600) {
        try {
            if (empty($object)) {
                return '';
            }
            $this->ossObj->setUseSSL(true);
            $info = $this->ossObj->signUrl($this->bucket, $object, $timeOut);
            return $info;
        } catch (OssException $e) {
            throw new Failure($e->getMessage());
        }
    }


    private function setError($msg) {
        $this->error = $msg;
    }

    public function getError() {
        return $this->error;
    }


}