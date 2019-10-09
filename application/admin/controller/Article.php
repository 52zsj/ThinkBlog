<?php


namespace app\admin\controller;

use app\admin\logic\Oss as OssLogic;
use app\common\exception\Failure;
use app\common\exception\Success;
use app\common\model\Article as ArticleModel;
use app\common\model\ArticleTags;
use app\common\model\Tag as TagModel;
use app\common\model\Column as ColumnModel;
use think\Db;
use think\Exception;
use think\exception\PDOException;
use think\exception\RouteNotFoundException;

class Article extends Base
{
    protected $savePath = '';

    public function initialize() {
        parent::initialize();
        $this->model = new ArticleModel();
        $this->savePath = $this->uploadPath . 'article' . DIRECTORY_SEPARATOR;
        $columnList = ColumnModel::getTreeColumnList();
        $this->assign('column_tree_list', $columnList);
    }

    /**
     * 新增
     * @return string
     * @throws Failure
     * @throws Success
     */
    public function add() {
        if ($this->request->isAjax()) {
            $params = $this->request->param();
            $tagIds = $params['tag_ids'];
            unset($params['tag_ids']);
            Db::startTrans();
            $pk = $this->model->getpk();
            try {
                $result = $this->model->allowField(true)->save($params);
                if (!empty($tagIds)) {
                    $tagIdList = explode(',', $tagIds);//数组
                    $id = $this->model->$pk;
                    $articleTagList = [];
                    foreach ($tagIdList as $k => $v) {
                        $articleTagListTmp['article_id'] = $id;
                        $articleTagListTmp['tag_id'] = $v;
                        $articleTagList[] = $articleTagListTmp;
                    }
                    $articleTagModel = new ArticleTags();
                    $artTagResult = $articleTagModel->saveAll($articleTagList);
                }
                Db::commit();
            } catch (Exception $e) {
                Db::rollback();
                throw new Failure($e->getMessage());
            }
            throw new Success('添加成功', $this->model->$pk);
        }
        return $this->view->fetch();
    }

    /**
     * 编辑
     */
    public function edit($id = null) {
        $row = $this->model->with(['tags' => function ($query) {
            $query->with(['tagList' => function ($query) {
                $query->field('name,id');
            }]);
        }])->get($id);
        if (!$row) {
            throw new Failure('数据已被删除');
        }
        $tags = $row['tags'];
        $tagList = array_column($tags->toArray(), 'tag_list');
        $tagIdsStr = implode(',', array_column($tagList, 'id'));
        $this->assign('tag_ids', $tagIdsStr);
        $this->assign('tag', $tagList);
        if ($this->request->isAjax()) {
            $params = $this->request->param();
            $tagIds = $params['tag_ids'];
            unset($params['tag_ids']);
            Db::startTrans();
            try {
                $result = $row->allowField(true)->save($params);
                //删除原有数据
                $delResult = ArticleTags::where('article_id', 'eq', $id)->delete();
                if (!empty($tagIds)) {
                    $articleTagList = [];
                    $tagIdList = explode(',', $tagIds);//数组
                    foreach ($tagIdList as $k => $v) {
                        $articleTagListTmp['article_id'] = $id;
                        $articleTagListTmp['tag_id'] = $v;
                        $articleTagList[] = $articleTagListTmp;
                    }
                    //重新创建数据
                    $articleTagModel = new ArticleTags();
                    $artTagResult = $articleTagModel->saveAll($articleTagList);
                }
                Db::commit();
            } catch (Exception $e) {
                Db::rollback();
                throw new Failure($e->getMessage());
            }
            throw new Success('更新成功');

        }

        $this->assign("row", $row);
        return $this->view->fetch();
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