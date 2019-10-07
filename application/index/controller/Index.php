<?php

namespace app\index\controller;

use app\common\exception\Failure;
use app\common\exception\Success;
use app\common\model\Album as AlbumModel;
use app\common\model\Article as ArticleModel;

class Index extends Base
{
    protected $pageSize = 8;

    public function initialize() {
        parent::initialize();
    }

    public function index() {
        //文章总数
        $articleTotal = ArticleModel::where('status', 1)->count();
        $this->assignConfig('article_total', $articleTotal);

        if ($this->request->isAjax()) {
            $offset = $this->request->param('offset');
            $limit = $this->pageSize;
            $row = ArticleModel::where('status', 1)->field('id,title,cover,content')->page($offset, $limit)->select();
            throw new Success('加载成功', ['row' => $row]);
        }
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
