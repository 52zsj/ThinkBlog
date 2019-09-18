<?php


namespace app\admin\controller;


use app\admin\logic\Oss as OssLogic;
use app\common\exception\Failure;
use app\common\exception\Success;
use app\common\model\Album as AlbumModel;
use app\common\model\AlbumItem as AlbumItemModel;
use think\App;
use think\Db;
use think\Exception;
use think\exception\PDOException;
use think\facade\Env;
use think\facade\Log;


class Album extends Base
{

    protected $savePath = '';

    public function __construct(App $app = null) {
        parent::__construct($app);
        $this->savePath = $this->uploadPath . 'album' . DIRECTORY_SEPARATOR;
    }

    public function index() {
        $keywords = $this->request->param('keywords', '');
        $this->assign('keywords', $keywords);
        $where = [];
        if (!empty($keywords)) {
            $where[] = ['title|description', 'like', '%' . $keywords . '%'];
        }
        $albumList = AlbumModel::where($where)->paginate(5);
        $ossLogic = new OssLogic($this->ossConfig); //oss对象
        foreach ($albumList as $k => &$v) {
            $v['music_tmp'] = $ossLogic->getFileUrl($v['music']);
            $v['cover_tmp'] = $ossLogic->getFileUrl($v['cover']);
        }
        unset($v);
        $pages = $albumList->render();
        $this->assign('page', $pages);
        $this->assign('album_list', $albumList);
        return $this->fetch();
    }

    public function add() {
        if ($this->request->isPost()) {
            $param = $this->request->param();
            $fullPath = $param['full_path'];
            unset($param['full_path']);
            Db::startTrans();
            try {
                $info = AlbumModel::create($param);
                $id = $info->id;
                if (!empty($fullPath)) {
                    $fullPathArray = explode(',', $fullPath);
                    foreach ($fullPathArray as $k => $v) {
                        $fullPathTmp['albun_id'] = $id;
                        $fullPathTmp['full_path'] = $v;
                        $fullPathTmp['thumb_path'] = '';
                        $fullPathList [] = $fullPathTmp;
                    }
                    $albumItemModel = new  AlbumItemModel();
                    $albumItemModel->saveAll($fullPathList);
                }
                Db::commit();
            } catch (Exception $e) {
                Log::write($e->getMessage(), 'debug');
                throw new Failure('添加失败');
                Db::rollback();
            } catch (PDOException $e) {
                Log::write($e->getMessage(), 'debug');
                throw new Failure('添加失败');
                Db::rollback();
            }
            throw new Success('添加成功');


        }
        return $this->fetch();
    }

    public function edit($id = '') {
        $row = AlbumModel::get($id);
        if (!$row) {
            throw new Failure('数据已被删除');
        }
        $ossLogic = new OssLogic($this->ossConfig); //oss对象
        $row['cover_tmp'] = $row['music_tmp'] = '';
        if (!empty($row['cover'])) {
            $row['cover_tmp'] = $ossLogic->getFileUrl($row['cover']);
        }
        if (!empty($row['music'])) {
            $row['music_tmp'] = $ossLogic->getFileUrl($row['music']);
        }

        $this->assign('row', $row);

        if ($this->request->isPost()) {
            $param = $this->request->param();
            $fullPath = $param['full_path'];
            unset($param['full_path']);
            Db::startTrans();
            try {
                $info = $row->save($param);
                if (!empty($fullPath)) {
                    $fullPathArray = explode(',', $fullPath);
                    foreach ($fullPathArray as $k => $v) {
                        $fullPathTmp['albun_id'] = $id;
                        $fullPathTmp['full_path'] = $v;
                        $fullPathTmp['thumb_path'] = '';
                        $fullPathList [] = $fullPathTmp;
                    }
                    $albumItemModel = new  AlbumItemModel();
                    $albumItemModel->saveAll($fullPathList);
                }
                Db::commit();
            } catch (Exception $e) {
                Log::write($e->getMessage(), 'debug');
                throw new Failure('更新失败');
                Db::rollback();
            } catch (PDOException $e) {
                Log::write($e->getMessage(), 'debug');
                throw new Failure('更新失败');
                Db::rollback();
            }
            throw new Success('更新成功');
        }
        return $this->fetch();

    }

    public function del($id = '') {
        throw new Failure('删除失败');
    }

    public function detail($id = '') {
        $row = AlbumItemModel::where('albun_id', $id)->select();
        if (!$row) {
            throw new Failure('数据已被删除');
        }
        $ossLogic = new OssLogic($this->ossConfig); //oss对象
        foreach ($row as $k => &$v) {
            $v['full_path_tmp'] = $ossLogic->getFileUrl($v['full_path']);
        }
        if ($this->request->isPost()) {

        }
        $this->assign('row', $row);
        return $this->fetch();
    }

    /**
     * 文件上传
     * @throws Failure
     * @throws Success
     */
    public function fileUpload() {
        $file = $this->request->file('file');
        $rootPath = Env::get('root_path');//根目录
        $absolutePath = $rootPath . $this->savePath; //绝对路径
        $info = $file->move($absolutePath, true, false);
        // throw new Failure('上传失败');
        if (!empty($info)) {
            //上传到oss
            $saveName = $this->savePath . $info->getSaveName();//带日期保存
            unset($info);
            $ossLogic = new OssLogic($this->ossConfig); //oss对象
            $result = $ossLogic->uploadToOss($rootPath, $saveName);
            unset($ossLogic);
            throw new Success('上传成功', $result);
        }
        throw new Failure('上传失败');
    }
}