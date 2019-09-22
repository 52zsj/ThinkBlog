<?php


namespace app\index\controller;


use app\common\exception\Failure;
use app\common\exception\Success;
use think\App;
use app\common\model\Album as AlbumModel;

class Album extends Base
{
    protected $pageSize = 8;

    public function __construct(App $app = null) {
        parent::__construct($app);
        $this->model = new AlbumModel();


    }

    public function index() {
        //首页吧
        $where['status'] = 1;
        $count = $this->model->where($where)->count();
        if ($this->request->isAjax()) {
            $offset = $this->request->param('offset', '0');
            $limit = $this->pageSize;
            $row = $this->model->where($where)->field('id,title,cover,description')->page($offset, $limit)->select()->toArray();
            $row=array_chunk($row,2);
            throw new Success('加载成功', ['row' => $row]);
        }
        $this->assignConfig(['page_data' => ['total' => $count, 'limit' => $this->pageSize]]);
        // 模板变量赋值
        return $this->fetch();
    }

    public function detail() {
        $id = $this->request->param('album_id');
        if (!$id) {
            $this->error('数据异常');
        }
        $where = ['id' => $id, 'status' => 1];
        $row = $this->model->where($where)->with('item')->find();
        $count = count($row['item']);
        $this->assign('row', $row);
        $this->assign('count', $count);
        return $this->fetch('detail');
    }
}