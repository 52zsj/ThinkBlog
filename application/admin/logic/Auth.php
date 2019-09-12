<?php


namespace app\admin\logic;


use app\common\exception\Failure;
use app\common\model\Admin;
use think\facade\Request;
use think\facade\Session;


class Auth
{
    private static $instance;
    protected $rules = [];
    protected $request;


    public function __construct() {
        // 初始化request
        $this->request = Request::instance();
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

    public function login($userName,$password) {
        if ($this->isLogin()) {
            throw new Failure('您已登录请勿重复登录，正在为您跳转至后台管理页', [], 'index');
        }
        $adminInfo = $this->getAdminInfoByUserName($userName);
        if (empty($adminInfo)) {
            throw new Failure('未找到该用户！');
        }
        $requestPassword = $this->createPassword($password, $adminInfo['salt']);

        if ($adminInfo['password'] != $requestPassword) {
            throw new Failure('密码不正确，请重新输入');
        }
        unset($adminInfo['password']);
        unset($adminInfo['salt']);
        Session::set('admin_info', $adminInfo);
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

    /**
     * 获取后台用户
     * @param $id
     * @return mixed
     */
    public function getAdminInfo($id) {
        static $adminInfo = [];
        if (!isset($adminInfo[$id])) {
            $adminInfo[$id] = Admin::where('id', $id)->find();
        }
        return $adminInfo[$id];
    }

    /**
     * 根据用户名找数据
     * @param $userName
     * @return mixed
     */
    public function getAdminInfoByUserName($userName){
        static $adminInfoByUserName = [];
        if (!isset($adminInfoByUserName[$userName])) {
            $adminInfoByUserName[$userName] = Admin::where('user_name', $userName)->find();
        }
        return $adminInfoByUserName[$userName];
    }
}