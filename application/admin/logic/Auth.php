<?php


namespace app\admin\logic;


use app\common\model\Admin;

class Auth
{
    
    public function getAdminInfo($userName){
        $adminInfo =Admin::where('user_name',$userName)->find();
        return $adminInfo;
    }
    public function createPassword($password,$sort){
        return md5(md5($password).$sort);
    }
    
}