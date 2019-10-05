<?php


namespace app\admin\controller;

use app\common\exception\Failure;
use app\common\exception\Success;
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

    /**
     * 编辑
     */
    public function edit($id = null) {
        $row = $this->model->get($id);
        $tagIdList = explode(',', $row['tag_ids']);
        $tag = TagModel::whereIn('id', $tagIdList)->column('name', 'id');
        $this->assign('tag', $tag);
        return parent::edit($id);
    }


}