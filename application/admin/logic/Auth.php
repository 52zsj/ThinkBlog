<?php


namespace app\admin\logic;


use app\common\model\Admin;
use think\facade\Request;
use think\facade\Session;


class Auth
{
    protected static $instance;
    protected $rules = [];
    protected $request;

    public function __construct() {
        // 初始化request
        $this->request = Request::instance();
    }

    public function getAdminInfo($userName) {
        $adminInfo = Admin::where('user_name', $userName)->find();
        return $adminInfo;
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

    /**
     * 验证是否存在
     * @param array $verifyRuleArray
     * @return bool
     */
    public function verify($verifyRuleArray = []) {
        $verifyRuleArray = is_array($verifyRuleArray) ? $verifyRuleArray : explode(',', $verifyRuleArray);
        if (empty($verifyRuleArray)) {
            return false;
        }
        //转小写 去重
        $verifyRuleArray = array_unique(array_map('strtolower', $verifyRuleArray));

        $action = strtolower($this->request->action());
        // 是否存在
        if (in_array($action, $verifyRuleArray) || in_array('*', $verifyRuleArray)) {
            return true;
        }
        //未找到匹配项
        return false;
    }

    /**
     * 是否登录状态
     * @return bool
     */
    public function isLogin() {
        $admin = Session::get('admin_info');
        if (empty($admin)) {
            return false;
        }
        return true;
    }
    /**
     * 密码生成
     * @param $password
     * @param $sort
     * @return string
     */
    public function createPassword($password, $sort) {
        return md5(md5($password) . $sort);
    }


}