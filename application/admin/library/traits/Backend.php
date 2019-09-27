<?php

namespace app\admin\library\traits;

use think\Db;
use think\Exception;
use think\exception\PDOException;
use app\common\exception\Failure;
use app\common\exception\Success;

trait Backend
{

    /**
     * 查看
     */
    public function index() {
        //设置过滤方法
        $this->request->filter(['strip_tags']);
        $row = $this->model->paginate();
        $pages = $row->render();
        $this->assign('page', $pages);
        $this->assign('row', $row);
        return $this->fetch();
    }

    /**
     * 添加
     */
    public function add() {
        if ($this->request->isAjax()) {
            $params = $this->request->param();
            $result = $this->model->allowField(true)->save($params);
            if ($result) {
                throw new Success('添加成功');
            } else {
                throw new Failure('添加失败');
            }
        }
        return $this->view->fetch();
    }

    /**
     * 编辑
     */
    public function edit($id = null) {
        $row = $this->model->get($id);
        if (!$row) {
            throw new Failure('数据已被删除');
        }
        if ($this->request->isAjax()) {
            $params = $this->request->param();
            $result = $row->allowField(true)->save($params);
            if ($result) {
                throw new Success('更新成功');
            }
            throw new Failure('更新失败');
        }
        $this->view->assign("row", $row);
        return $this->view->fetch();
    }

    /**
     * 删除
     */
    public function del($id = "") {
        if ($id) {
            $pk = $this->model->getPk();
            $list = $this->model->where($pk, 'in', $id)->select();
            $count = 0;
            Db::startTrans();
            try {
                foreach ($list as $k => $v) {
                    $count += $v->delete();
                }
                Db::commit();
            } catch (PDOException $e) {
                Db::rollback();
                throw new Failure($e->getMessage());
            } catch (Exception $e) {
                Db::rollback();
                throw new Failure($e->getMessage());
            }
            if ($count) {
                throw new Success('删除成功');
            } else {
                throw new Failure('没有删除任何行');
            }
        }
        throw new Failure('参数异常');
    }

    /********************************以下方法未使用********************************/
    /**
     * 真实删除
     */
    public function destroy($ids = "") {
        $pk = $this->model->getPk();
        $adminIds = $this->getDataLimitAdminIds();
        if (is_array($adminIds)) {
            $this->model->where($this->dataLimitField, 'in', $adminIds);
        }
        if ($ids) {
            $this->model->where($pk, 'in', $ids);
        }
        $count = 0;
        Db::startTrans();
        try {
            $list = $this->model->onlyTrashed()->select();
            foreach ($list as $k => $v) {
                $count += $v->delete(true);
            }
            Db::commit();
        } catch (PDOException $e) {
            Db::rollback();
            $this->error($e->getMessage());
        } catch (Exception $e) {
            Db::rollback();
            $this->error($e->getMessage());
        }
        if ($count) {
            $this->success();
        } else {
            $this->error(__('No rows were deleted'));
        }
        $this->error(__('Parameter %s can not be empty', 'ids'));
    }

    /**
     * 还原
     */
    public function restore($ids = "") {
        $pk = $this->model->getPk();
        $adminIds = $this->getDataLimitAdminIds();
        if (is_array($adminIds)) {
            $this->model->where($this->dataLimitField, 'in', $adminIds);
        }
        if ($ids) {
            $this->model->where($pk, 'in', $ids);
        }
        $count = 0;
        Db::startTrans();
        try {
            $list = $this->model->onlyTrashed()->select();
            foreach ($list as $index => $item) {
                $count += $item->restore();
            }
            Db::commit();
        } catch (PDOException $e) {
            Db::rollback();
            $this->error($e->getMessage());
        } catch (Exception $e) {
            Db::rollback();
            $this->error($e->getMessage());
        }
        if ($count) {
            $this->success();
        }
        $this->error(__('No rows were updated'));
    }

    /**
     * 回收站
     */
    public function recyclebin() {
        //设置过滤方法
        $this->request->filter(['strip_tags']);
        if ($this->request->isAjax()) {
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();
            $total = $this->model
                ->onlyTrashed()
                ->where($where)
                ->order($sort, $order)
                ->count();

            $list = $this->model
                ->onlyTrashed()
                ->where($where)
                ->order($sort, $order)
                ->limit($offset, $limit)
                ->select();

            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch();
    }


}
