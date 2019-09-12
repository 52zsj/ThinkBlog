<?php


namespace app\admin\logic;


use app\common\exception\Failure;
use think\facade\Env;

class Upload
{
    private static $instance = null;

    protected $rootPath;


    public function __construct() {
        // 初始化request
        $this->rootPath = self::getRootPath();
    }


    /**
     * 初始化
     * @param array $options
     * @return Auth
     */
    public static function instance($options = []) {
        if (is_null(self::$instance)) {
            self::$instance = new static($options);
        }
        return self::$instance;
    }

    public function uploadToPath($file, $path) {

        if (!$file) {
            throw new Failure('上传文件不能为空');
        }
        if (!$path) {
            throw new Failure('路径不能为空');
        }
        $info = $file->move($this->rootPath . $path);
        if (!empty($info)) {
            return $info;
        }
        return false;
    }

    public function getRootPath() {
        return Env::get('root_path');
    }
}