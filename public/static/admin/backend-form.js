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
                form.on('submit(submit)', function (data) {
                    var datas = data.field;
                    var form_obj = $(data.form);
                    if (typeof $(form_obj) !== 'object') {
                        layer.msg('表单异常！', {shift: -1, icon: 5}, function () {
                        });
                        return false;
                    }
                    var type = form_obj.attr('method') ? form_obj.attr('method').toUpperCase() : 'GET';
                    type = type && (type === 'GET' || type === 'POST') ? type : 'GET';
                    var url = form_obj.attr('action');
                    url = url ? url : location.href;
                    lucklyJack.api.ajax({
                        type: type,
                        url: url,
                        data: datas,
                        dataType: 'JSON'
                    }, showToastr, function (data, res) {
                        if (typeof success === 'function') {
                            if (false === success.call(form, data, res)) {
                                return false;
                            }
                        }
                        layer.msg(res.msg, {icon: 6}, function () {
                            if (res.jump_url != '') {
                                window.location.href = res.jump_url;
                            }
                            //关闭当前frame
                            xadmin.close();
                            // 可以对父窗口进行刷新
                            xadmin.father_reload();
                        });
                    }, function (data, res) {
                        if (typeof error === 'function') {
                            if (false === error.call(form, data, res)) {
                                return false;
                            }
                        }
                        layer.msg(res.msg, {shift: -1, icon: 5}, function () {
                            if (res.jump_url != '') {
                                window.location.href = res.jump_url;
                            }
                        });
                        return false;
                    });
                    if (exit == false) {
                        return false;
                    }

                });
            },
            validate: function (form) {
                $("form [name]").each(function (k, v) {
                    var data_verify = $(v).data('verifys');
                    var name = $(v).attr('name');//表单的name
                    var arr = data_verify.split('|');
                    var data = [];
                    var form_verify = {};
                    var strs = '[';
                    $.each(arr, function (k, v) {
                        console.log(v);
                        strs += v+',';
                    });
                    strs += ']';

                    console.log(strs);
                    return;
                    //测试
                    var obj_str = "verify_obj." + name + "=" + '[\"' + data_verify + '\",\"' + data_verify_msg + '\"]';

                    console.log(data);
                    console.log(data_verify);


                    return false;

                })
            },
            bindevent(form, showToastr = false, success, error, exit = false) {
              //  Form.api.validate(form);

                Form.api.submit(form, showToastr, success, error, exit);
            }
        },
        //初始化


    };
    return Form;

});
