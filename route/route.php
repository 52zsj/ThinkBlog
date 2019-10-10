<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------


Route::group(['ext' => 'html'], function () {
    Route::rule('/', 'index/index/index');
    Route::rule('search', 'index/index/search');
    Route::rule('album', 'index/album/index');
    Route::rule('album_detail/:album_id', 'index/album/detail');
    Route::rule('article_detail/:article_id', 'index/article/detail');
    Route::rule('tag/:tag_id', 'index/article/tagList');
});


return [

];
