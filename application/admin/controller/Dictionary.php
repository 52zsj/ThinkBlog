<?php


namespace app\admin\controller;

use app\admin\logic\Auth;
use app\common\exception\Failure;
use app\common\exception\Success;
use app\common\library\Random;
use app\common\model\Admin as AdminModel;
use app\common\model\Dictionary as DictionaryModel;

use think\App;

class Dictionary extends Base
{
    public function __construct(App $app = null) {
        parent::__construct($app);
        $group= DictionaryModel::group('group')->column('group');
        $this->assign('group',$group);
    }

    public function index() {
        $row = DictionaryModel::paginate();
        $pages = $row->render();
        $this->assign('page', $pages);
        $this->assign('row', $row);
        return $this->fetch();
    }

    public function add() {
        if ($this->request->isAjax()) {
            $params = $this->request->param();
            $result = DictionaryModel::create($params,true);
            if ($result) {
                throw new Success('添加成功');
            } else {
                throw new Failure('添加失败');
            }
        }
        return $this->fetch();
    }

    public function edit($id = '') {
        $row = DictionaryModel::get($id);
        if (empty($row)) {
            throw new Failure('数据已被删除');
        }
        $this->assign('row', $row);
        if ($this->request->isAjax()) {
            $params = $this->request->param();
            $result = $row->save($params);
            if ($result) {
                throw new Success('更新成功');
            } else {
                throw new Failure('更新失败');
            }
        }

        return $this->fetch();
    }
}