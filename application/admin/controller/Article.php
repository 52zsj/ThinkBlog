<?php


namespace app\admin\controller;

use app\admin\logic\Oss as OssLogic;
use app\common\exception\Failure;
use app\common\exception\Success;
use app\common\model\Article as ArticleModel;
use app\common\model\Tag as TagModel;
use app\common\model\Column as ColumnModel;

class Article extends Base
{
    protected $savePath='';
    public function initialize() {
        parent::initialize();
        $this->model = new ArticleModel();
        $this->savePath = $this->uploadPath . 'article' . DIRECTORY_SEPARATOR;
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

    public function fileUpload() {
        $file = $this->request->file('file');
        $publicPath = $this->rootPath . 'public' . DIRECTORY_SEPARATOR;//public目录
        $absolutePath = $publicPath . $this->savePath; //绝对路径
        $info = $file->move($absolutePath, true, false);
        // throw new Failure('上传失败');
        if (!empty($info)) {
            //上传到oss
            $saveName = $this->savePath . $info->getSaveName();//带日期保存
            unset($info);
            $result['ossUrl'] = '';
            $result['localUrl'] = $saveName;
            if ($this->ossConfig['open'] == 1) {
                $ossLogic = new OssLogic($this->ossConfig); //oss对象
                $result = $ossLogic->uploadToOss($publicPath, $saveName);
                unset($ossLogic);
            }
            throw new Success('上传成功', $result);
        }
        throw new Failure('上传失败');
    }


}