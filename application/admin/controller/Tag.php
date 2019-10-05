<?php


namespace app\admin\controller;


use app\common\exception\Failure;
use app\common\exception\Success;
use  app\common\model\Tag as TagModel;

class Tag extends Base
{
    protected $model = null;

    public function initialize() {
        parent::initialize();
        $this->model = new TagModel();
    }

    public function getRandTagList() {
        //随机取出20位
        $data = $this->model->getRandTagList();
        if (!empty($data)) {
            throw new Success('请求成功', $data);
        }
        throw new Failure('请求失败', []);

    }

}