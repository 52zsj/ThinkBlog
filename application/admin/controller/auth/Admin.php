<?php


namespace app\admin\controller\auth;


use app\admin\controller\Base;
use think\App;

class Admin extends Base
{
   public function __construct(App $app = null) {
       parent::__construct($app);
   }


   public function index(){

       return $this->fetch();
   }

}