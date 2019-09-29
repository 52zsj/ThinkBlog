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
        'layui': '../libs/layui/dist/layui.all',
        'template': '../libs/art-template/lib/template-web',
        'photor': '../libs/photor/dist/photor',
        'xadmin': 'js/xadmin',
        'form': 'backend-form',
        'ueditor': '../other/ueditor/ueditor.all',
        'ueditor.config': '../other/ueditor/ueditor.config',
        'ueditor.cn': '../other/ueditor/lang/zh-cn/zh-cn',
        'zeroclipboard': '../other/ueditor/third-party/zeroclipboard/ZeroClipboard.min',
        'jack.table': 'backend-table'


    },
    included: ['css', 'toastr'],
    shim: {
        'jquery': {deps: ['css!../libs/font-awesome/css/font-awesome.css']},
        'validator': ['../libs/nice-validator/dist/jquery.validator.min', 'css!../libs/nice-validator/dist/jquery.validator.css'],
        'citypicker': ['citypicker-data', 'css!../libs/city-picker/dist/css/city-picker.css'],
        'bootstrap': ['jquery'],
        'bootstrap-datetimepicker': [
            'moment/locale/zh-cn',
            'css!../libs/bootstrap/dist/css/bootstrap.css',
            'css!../libs/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css',
        ],
        'layui': {deps: ['css!../libs/layui/dist/css/layui.css'], exports: "layui",},
        'scrollreveal': {exports: 'scrollreveal'},
        'hcsticky': {exports: '$.fn.hcsticky'},
        'toastr': ['css!../libs/toastr/toastr.min.css'],
        'photor': {deps: ['css!../libs/photor/dist/photor.min.css', 'jquery'], exports: "photor"},
        'albumplugin': {exports: "albumplugin"},
        'xadmin': {deps: ['jquery', 'layui'], exports: "xadmin"},
        'ueditor': {
            deps: ['zeroclipboard', 'ueditor.config'],
            exports: 'UE',
            init: function (ZeroClipboard) {
                //导出到全局变量，供ueditor使用
                window.ZeroClipboard = ZeroClipboard;
            },
        },
        'ueditor.cn': ['ueditor'],

    },
    map: {
        '*': {
            'css': '../libs/require-css/css.min'
        }
    },
    baseUrl: '/static/admin/', //资源基础路径
});
//初始化
require(['jquery'], function ($) {
    $(function () {
        require(['lucklyJack'], function (lucklyJack) {
            //初始配置
            var Config = requirejs.s.contexts._.config.config;
            //渲染至全局
            window.Config = Config;
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