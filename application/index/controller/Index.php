<?php

namespace app\index\controller;

use app\common\exception\Failure;
use app\common\model\Album as AlbumModel;

class Index extends Base
{
    public function index() {
        return $this->fetch();
    }

    public function album() {
        $id = $this->request->param('album_id');
        if (!$id) {
            throw new Failure('参数错误');
        }
        $row = AlbumModel::where('id', $id)->with('item')->find();
        if ($this->ossConfig['open'] == 1) {
            //数据转换
        }
        $this->assign('row', $row);
        $template = rand(1, 3);//随即便换
        return $this->fetch('album_' . $template);
    }

    public function hello() {
        dump($this->request->param('name'));
    }
}
