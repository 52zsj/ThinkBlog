define(['xadmin'], function (xadmin) {
    var Controller = {
            index: function () {
                Controller.api.bindevent();

            },
            add: function () {
                Controller.api.bindevent();
                layui.use(['form', 'layer'], function () {
                    var form = layui.form,
                        layer = layui.layer;
                    form.verify({
                        nikename: function (value) {
                            if (value.length < 1) {
                                return '昵称至少得5个字符啊';
                            }
                        },
                        password: [/(.+){6,16}$/, '密码必须6到16位'],
                        repass: function (value) {
                            if ($('#password').val() != $('#repass').val()) {
                                return '两次密码不一致';
                            }
                        }
                    });
                    //监听提交
                    Controller.api.submit(form);
                });

            },
            edit: function () {
                Controller.api.bindevent();
                layui.use(['form', 'layer'], function () {
                    $ = layui.jquery;
                    var form = layui.form,
                        layer = layui.layer;
                    //监听提交
                    Controller.api.submit(form);


                });
            },

            api: {
                bindevent: function () {
                    Controller.events.to_big();
                },
                submit: function (form) {
                    form.on('submit(submit)', function (data) {
                        console.log(data);
                        var datas = data.field;
                        lucklyJack.api.ajax({
                            type: 'POST',
                            data: datas,
                            dataType: 'JSON'
                        }, false, function (data, res) {
                            layer.alert(res.msg, {icon: 6}, function () {
                                //关闭当前frame
                                xadmin.close();
                                // 可以对父窗口进行刷新
                                xadmin.father_reload();
                            });

                        }, function (data, res) {
                            layer.msg(res.msg, {shift: -1, time: 2000, icon: 5}, function () {
                            });
                        });
                        return false;
                    });
                }

            },
            events: {
                to_big: function () {
                    $(document).on('click', '.to-big', function () {
                        var url = $(this).attr('src');
                        var img_html = "<img style='width: 100%' src='" + url + "'/>";
                        layer.open(
                            {
                                type: 1,
                                title: false,
                                content: img_html,
                                closeBtn: 2,
                                anim: 2,
                            }
                        )
                    });
                }
            }

        }
    ;
    return Controller;

});