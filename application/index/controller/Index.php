<?php

namespace app\index\controller;

use app\common\exception\Failure;
use app\common\exception\Success;
use app\common\library\Enum;
use app\common\model\Album as AlbumModel;
use app\common\model\Article as ArticleModel;
use app\common\model\Dictionary;

class Index extends Base
{
    protected $pageSize = 8;

    public function initialize() {
        parent::initialize();
    }

    public function index() {
        //我的相册
        $albumList = AlbumModel::limit(6)->order('create_time desc')->select();
        //站长推荐
        $isRecommendList = ArticleModel::where(['status' => 1, 'is_recommend' => 1])->limit(8)->order('order_key asc,create_time desc')->select();
        //友情链接？？丢一边去
        $friendlyLink = Dictionary::getValueByGroup(Enum::DIDCTIONARY_FRIENDLY_LINK);
        // echo ArticleModel::getLastSql();
        //文章总数

        if ($this->request->isAjax()) {
            $offset = $this->request->param('offset');
            $keyword = $this->request->param('keyword');
            // $keyword = '张三';
            $limit = $this->pageSize;
            $where[] = ['status', '=', 1];
            if (!empty($keyword)) {
                $where[] = ['title', 'like', '%' . $keyword . '%'];
            }
            //文章总数
            $articleTotal = ArticleModel::where($where)->count();
            $row = ArticleModel::where($where)->field('id,title,cover,content,description')->page($offset, $limit)->select();
            foreach ($row as $k => &$v) {
                $v['detail_url'] = url('index/article/detail', ['article_id' => $v['id']]);
            }
            unset($v);
            throw new Success('加载成功', ['row' => $row, 'total' => $articleTotal, 'limit' => $limit]);
        }
        $this->assign('friendly_link', $friendlyLink);
        $this->assign('album_lisst', $albumList);
        $this->assign('is_recomment_list', $isRecommendList);

        $this->assignConfig('request_url', url('index/index/index'));
        return $this->fetch();
    }
}
