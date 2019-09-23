define(['jquery', 'layui'], function ($, layui) {
    var Form = {
        //预留
        config: {
            varify: ['required', 'phone', 'email', 'url', 'number', 'date', 'identity'],//默认
        },
        //事件
        events: {},

        //接口
        api: {

            submit: function (form, showToastr = false, success, error, exit = false) {
                if (form.size() === 0) {
                    layer.msg('表单未初始化完成，无法操作~');
                    return false;
                }
                //请求类型
                var type = form.attr('method') ? form.attr('method').toUpperCase() : 'GET';
                type = type && (type === 'GET' || type === 'POST') ? type : 'GET';
                //请求地址
                url = form.attr('action');
                url = url ? url : location.href;
                form.on('submit(submit)', function (data) {
                    var datas = data.field;
                    lucklyJack.api.ajax({
                        type: type,
                        url: url,
                        data: datas,
                        dataType: 'JSON'
                    }, showToastr, success, error);
                    if (exit == false) {
                        return false;
                    }
                });
            },
            validate: function (form) {
            },
            bindevent(form, showToastr = false, success, error, exit = false) {
                Form.api.validate(form);
                Form.api.submit(form, showToastr, success, error, exit);

            }
        },
        //初始化


    };
    return Form;

});
