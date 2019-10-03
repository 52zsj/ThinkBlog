<?php


namespace app\admin\controller;

use app\common\model\Article as ArticleModel;
use app\common\model\Tag as TagModel;
use app\common\model\Column as ColumnModel;

class Article extends Base
{
    public function initialize() {
        parent::initialize();
        $this->model = new ArticleModel();

        $columnList = ColumnModel::getTreeColumnList();
        $this->assign('column_tree_list', $columnList);
    }

}