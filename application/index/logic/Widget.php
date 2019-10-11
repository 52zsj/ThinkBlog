<?php


namespace app\index\logic;

use app\common\library\Enum;
use app\common\model\Article as ArticleModel;
use app\common\model\ArticleTags as ArticleTagsModel;
use app\common\model\Dictionary;
use app\common\model\Inspirational as inspirationalModel;
use think\facade\View;

class Widget
{
    /*缓存后面添加*/
    public static function allAction($return = false, $limit = 6) {
        $data = [];
        $data['inspirational'] = self::inspirational($return);
        $data['friendly_link'] = self::friendlyLink($return);
        $data['hot_article'] = self::hotArticle();
        $data['like_article'] = self::likeArticle($limit, $return);
        if ($return) {
            return $data;
        }
    }

    /**
     * 鸡汤
     * @param bool $return
     * @return mixed
     */
    public static function inspirational($return = false) {
        $inspirational = inspirationalModel::order('create_time', 'desc')->value('content');
        View::assign('inspirational', $inspirational);
        if ($return) {
            return $inspirational;
        }
    }

    /**
     * 友情链接
     * @param bool $return
     * @return array|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function friendlyLink($return = false) {
        $firendlyLink = Dictionary::getValueByGroup(Enum::DIDCTIONARY_FRIENDLY_LINK);
        View::assign('firendly_link', $firendlyLink);
        if ($return) {
            return $firendlyLink;
        }
    }

    /**
     * 热门文章
     * @param int $limit
     * @param bool $return
     * @return array|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function hotArticle($limit = 6, $return = false) {
        $hotArticleList = ArticleModel::order('watch_count', 'desc')->limit($limit)->field('id,title,cover,watch_count')->select();
        View::assign('hot_article_list', $hotArticleList);
        if ($return) {
            return $hotArticleList;
        }
    }

    /**
     * 点赞最多文章
     * @param int $limit
     * @param bool $return
     * @return array|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function likeArticle($limit = 5, $return = false) {
        $likeArticleList = ArticleModel::order('like desc,create_time desc')->limit($limit)->field('id,title,cover,like')->select();
        View::assign('like_article_list', $likeArticleList);
        if ($return) {
            return $likeArticleList;
        }
    }
    public static function tagCloud($return = false){
        //标签云
        $tagCloudList = ArticleTagsModel::with(['tagList' => function ($query) {
            $query->field('name,id');
        }])->field('count(*) as total,tag_id')->group('tag_id')->select();
        View::assign('tag_colud_list', $tagCloudList);
        if ($return) {
            return $tagCloudList;
        }
    }
}