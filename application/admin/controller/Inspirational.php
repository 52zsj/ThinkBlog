<?php


namespace app\admin\controller;

use app\common\model\Inspirational as InspirationalModel;
class Inspirational extends Base
{
    public function initialize() {
        parent::initialize(); // TODO: Change the autogenerated stub
        $this->model = new InspirationalModel();
    }
}