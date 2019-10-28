require.config({
    packages: [{
        name: 'moment',
        location: '../libs/moment',
        main: 'moment'
    }],
    paths: {
        'jquery': '../libs/jquery/dist/jquery.min',
        'toastr': '../libs/toastr/toastr.min',
        'layer': '../libs/layer/dist/layer',
        'scrollreveal': '../libs/scrollreveal/dist/scrollreveal',
        'hcsticky': '../libs/hc-sticky/dist/hc-sticky',
        'lucklyJack': '../common/js/luckly-jack',
        'layui':'../libs/layui/dist/layui.all',
        'common': 'js/common',
        'template':'../libs/art-template/lib/template-web',
        'albumplugin':'album-plugin',//相册插件显示内容
        'bootstrap':'../libs/bootstrap/dist/js/bootstrap.min',
        'treeview':'../libs/bootstrap-treeview/dist/bootstrap-treeview.min',
        "swipebox":'../libs/swipebox/src/js/jquery.swipebox',
        "axios":'../libs/axios/dist/axios.min'

    },
    included: ['css', 'toastr'],
    shim: {
        'validator': ['../libs/nice-validator/dist/jquery.validator.min', 'css!../libs/nice-validator/dist/jquery.validator.css'],
        'citypicker': ['citypicker-data', 'css!../libs/city-picker/dist/css/city-picker.css'],
        'bootstrap': ['jquery'],
        'bootstrap-datetimepicker': [
            'moment/locale/zh-cn',

        ],
        'layui': {deps: ['css!../libs/layui/dist/css/layui.css'], exports: "layui",},
        'scrollreveal': {exports: 'scrollreveal'},
        'hcsticky': {exports: '$.fn.hcsticky'},
        'toastr': ['css!../libs/toastr/toastr.min.css'],
        'albumplugin': {exports: "albumplugin"},
        'treeview': {deps: ['jquery','css!../libs/bootstrap-treeview/dist/bootstrap-treeview.min.css']},
        'swipebox': {deps: ['jquery', 'css!../libs/swipebox/src/css/swipebox.css'], exports: 'swipebox'},
        'axios': {exports: 'axios'}
    },
    map: {
        '*': {
            'css': '../libs/require-css/css.min'
        }
    },
    baseUrl: '/static/index/', //资源基础路径
});
//初始化
require(['jquery'], function ($) {
    $(function () {
        require(['lucklyJack','common'], function (lucklyJack,common) {
            //初始配置
            var Config = requirejs.s.contexts._.config.config;
            //渲染至全局
            window.Config = Config;
            window.common=common;
            //加载相应模块
            if (Config.jsName) {
                require([Config.jsName], function (Controller) {
                    if (Controller.hasOwnProperty(Config.actionName)) {
                        Controller[Config.actionName]();
                    } else {
                        if (Controller.hasOwnProperty("_empty")) {
                            Controller._empty();
                        }
                    }
                }, function (e) {
                    console.error(e);
                    // 这里可捕获模块加载的错误
                });
            }
        });

    });
});