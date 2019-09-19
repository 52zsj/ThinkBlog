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
        'lucklyJack': 'js/luckly-jack',

        'common': 'js/common'

    },
    included: ['css', 'toastr'],
    shim: {
        'validator': ['../libs/nice-validator/dist/jquery.validator.min', 'css!../libs/nice-validator/dist/jquery.validator.css'],
        'citypicker': ['citypicker-data', 'css!../libs/city-picker/dist/css/city-picker.css'],
        'bootstrap': ['jquery'],
        'bootstrap-datetimepicker': [
            'moment/locale/zh-cn',
            'css!../libs/bootstrap/dist/css/bootstrap.css',
            'css!../libs/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css',
        ],
        'scrollreveal': {exports: 'scrollreveal'},
        'hcsticky': {exports: '$.fn.hcsticky'},
        'toastr': ['css!../libs/toastr/toastr.min.css'],
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
        require(['lucklyJack','common'], function (lucklyJack) {
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