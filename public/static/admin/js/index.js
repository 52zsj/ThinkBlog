define(['xadmin'], function (xadmin) {
    var Controller = {
        index: function () {

        },
        login: function () {
            var length = Config.captcha_length;
            layui.use('form', function () {
                var form = layui.form;
                form.verify({
                    captcha: function (value, item) { //value：表单的值、item：表单的DOM对象
                        console.log(value);
                        if (value.length != length) {
                            return '请输入' + length + '位有效验证码!';
                        }
                    },
                    //我们既支持上述函数式的方式，也支持下述数组的形式
                    //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
                    // pass: [/^[\S]{6,12}$/,'密码必须6到12位，且不能出现空格']
                });
                // 监听提交
                form.on('submit(login)', function (data) {
                    var url = 'login';
                    var datas = data.field;
                    lucklyJack.api.ajax({
                        type: 'POST',
                        url: url,
                        data: datas,
                        dataType: 'JSON'
                    }, false, function (ret, res) {
                        console.log(res);
                        layer.msg(res.msg, {shift: -1, time: 2000, icon: 6}, function () {
                            window.location.href = res.jump_url;
                        });
                        return false;
                    }, function (ret, res) {
                        layer.msg(res.msg, {shift: -1, time: 2000, icon: 5}, function () {
                            if (res.jump_url != '') {
                                window.location.href = res.jump_url;
                            }
                        });
                        if ($("#captcha").length > 0) {
                            $("#captcha").trigger('click');
                        }
                    });
                    // $.ajax({
                    //     type: 'POST',
                    //     url: url,
                    //     data: datas,
                    //     dataType: 'JSON',
                    //     success: function (res) {
                    //         console.log(res);
                    //         //请求成功
                    //
                    //
                    //     },
                    // });
                    return false;
                });
            });
        },
        api: {
            bindevent: function () {
            }

        },
        events: {}
    };
    return Controller;

});