<?php


namespace app\admin\controller;


use think\App;
use app\common\model\Admin as AdminModel;

class Admin extends Base
{
    public static $filed = 'id,user_name,nick_name,join_ip,avatar,create_time,update_time,status';
    public function __construct(App $app = null) {
        parent::__construct($app);
    }


    public function index() {
        $adminList = AdminModel::field(self::$filed)->paginate();
        $pages = $adminList->render();
        $this->assign('page',$pages);
        $this->assign('admin_list', $adminList);

        return $this->fetch();
    }

    public function add() {

        return $this->fetch();
    }

    public function edit($id){

        return $this->fetch();
    }

}