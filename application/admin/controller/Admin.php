<?php


namespace app\admin\controller;


use think\App;

class Admin extends Base
{
    public function __construct(App $app = null) {
        parent::__construct($app);
    }


    public function index() {

        return $this->fetch();
    }

    public function add() {

        return $this->fetch();
    }


}