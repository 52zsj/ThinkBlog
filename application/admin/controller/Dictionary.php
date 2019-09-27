<?php


namespace app\admin\controller;

use app\common\model\Dictionary as DictionaryModel;

class Dictionary extends Base
{
    public function initialize() {
        parent::initialize();
        $group = DictionaryModel::group('group')->column('group');
        $this->assign('group', $group);
        $this->model = new DictionaryModel();
    }
}