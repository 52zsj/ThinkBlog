define(['jquery', 'layui'], function ($, layui) {
    var Form = {
        //预留
        config: {
            varify: ['required', 'phone', 'email', 'url', 'number', 'date', 'identity'],//默认
        },
        //事件
        events: {
            //编辑器
            ueditor: function () {
                if ($(".myeditor").length > 0) {
                    console.log('执行了myeditor');
                    window.UEDITOR_HOME_URL = "/static/other/ueditor/";
                    require(['ueditor', 'ueditor.cn'], function (UE, undefined) {
                        var ueditor = [];
                        $(".myeditor").each(function () {
                            var id = $(this).attr("id");
                            console.log(id);
                            ueditor[id] = UE.getEditor(id, {
                                // serverUrl: Fast.api.fixurl('/addons/ueditor/api/'),
                                allowDivTransToP: false, //阻止div自动转p标签
                                initialFrameWidth: '100%',
                                zIndex: 90,
                                xssFilterRules: false,
                                outputXssFilter: false,
                                inputXssFilter: false
                            });
                            console.log(ueditor[id]);
                        });

                    });
                }
            },
            //排序值最大为9999 最小为0 默认50
            order_key: function () {
                if ($(".order-key").length > 0) {
                    $(document).on('input onporpertychange', '.order-key', function () {
                        var value = $(this).val();
                        if (value != '') {
                            if (value >= 9999) {
                                $(this).val(9999);
                            } else if (value <= 0) {
                                $(this).val(0);
                            }
                        }
                    });
                }

            }
        },

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
            del: function () {
                $(document).on('click', '.del-data', function () {
                    var id = $(this).data('id');
                    var url = $(this).data('url');
                    var option = {id: id, url: url};
                    layer.confirm('确认要删除吗？', function (index) {
                        lucklyJack.api.ajax({
                            type: 'POST',
                            url: url,
                            data: {id: id},
                            dataType: 'JSON'
                        }, false, function (data, res) {
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
                        return false;
                    });
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
                        strs += v + ',';
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
            bindevent: function (form, showToastr = false, success, error, exit = false) {
                if (typeof form == 'undefined') {
                    form = Form.init();
                }
                //  Form.api.validate(form);

                Form.api.submit(form, showToastr, success, error, exit);
                Form.api.del();
                Form.events.ueditor();
                Form.events.order_key();
            },
        },
        init: function () {
            var form = null;
            layui.use(['form'], function () {
                form = layui.form;
            });
            return form;
        }
        //初始化


    };
    return Form;

});
