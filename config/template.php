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

// +----------------------------------------------------------------------
// | 模板设置
// +----------------------------------------------------------------------

return [
    // 模板引擎类型 支持 php think 支持扩展
    'type'         => 'Think',
    // 默认模板渲染规则 1 解析为小写+下划线 2 全部转换小写 3 保持操作方法
    'auto_rule'    => 1,
    // 模板路径
    'view_path'    => '',
    // 模板后缀
    'view_suffix'  => 'html',
    // 模板文件名分隔符
    'view_depr'    => DIRECTORY_SEPARATOR,
    // 模板引擎普通标签开始标记
    'tpl_begin'    => '{',
    // 模板引擎普通标签结束标记
    'tpl_end'      => '}',
    // 标签库标签开始标记
    'taglib_begin' => '{',
    // 标签库标签结束标记
    'taglib_end'   => '}',
    // 是否开启模板编译缓存,设为false则每次都会重新编译
    'tpl_cache'          => false,
    //变量替换
    'tpl_replace_string'  =>  [
        '__STATIC__'=>'/static',
        '__ADMIN_JS__' => '/static/admin/js',
        '__ADMIN_CSS__'=>'/static/admin/css',
        '__ADMIN_FONT'=>'/static/admin/fonts',
        '__ADMIN_LIB__'=>'/static/admin/lib',
        '__ADMIN_IMAGES__'=>'/static/admin/images',
        '__COMMON__'=>'/static/common',
        '__INDEX__'=>'/static/index',
        '__INDEX_JS__' => '/static/index/js',
        '__INDEX_CSS__' => '/static/index/css',
        '__INDEX_FONT' => '/static/index/fonts',
        '__INDEX_LIB__' => '/static/index/lib',
        '__INDEX_IMAGES__' => '/static/index/images',
    ]
];
