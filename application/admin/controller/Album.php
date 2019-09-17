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

    public function __construct(App $app = null) {
        parent::__construct($app);
    }

    public function index() {
        $albumList = AlbumModel::paginate();
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
        return $this->fetch();
    }

    public function fileUpload() {
        $file = $this->request->file('file');
        $savePath = DIRECTORY_SEPARATOR . 'public' . DIRECTORY_SEPARATOR . 'upload' . DIRECTORY_SEPARATOR . 'album' . DIRECTORY_SEPARATOR;//保存路径

        $rootPath = Env::get('root_path');//根目录
        $absolutePath = $rootPath . $savePath; //绝对路径
        $info = $file->move($absolutePath);
        if (!empty($info)) {
            //上传到oss
            // $fileName = $info->getFilename();//不带日期保存
            $saveName = $info->getSaveName();//带日期保存
            unset($info);
            $ossLogic = new OssLogic($this->ossConfig); //oss对象
            $result = $ossLogic->uploadToOss($saveName, $rootPath, $savePath, true);
            unset($ossLogic);
            throw new Success('上传成功', $result);
        }
        throw new Failure('上传失败');
    }
}