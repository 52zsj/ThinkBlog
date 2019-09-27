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
    public function initialize() {
        parent::initialize();
        $group = DictionaryModel::group('group')->column('group');
        $this->assign('group', $group);
        $this->model = new DictionaryModel();
    }
}