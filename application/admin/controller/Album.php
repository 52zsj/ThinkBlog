<?php


namespace app\admin\controller;

use app\common\model\Album as AlbumModel;
use think\App;


class Album extends Base
{

    public function __construct(App $app = null) {
        parent::__construct($app);
    }

    public function index() {
        $albumList = AlbumModel::paginate();
        $pages = $albumList->render();
        $this->assign('page', $pages);
        $this->assign('album_list', $albumList);
        return $this->fetch();
    }

    public function add() {
        if($this->request->isPost()){

        }
        return $this->fetch();
    }

    public function edit($id = '') {
        return $this->fetch();
    }
}