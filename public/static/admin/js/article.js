define(['xadmin', 'form', 'jack.table'], function (xadmin, Form, Table) {
    var Controller = {
            index: function () {
                var option = {
                    url_list: {
                        index_url: 'article/index',
                        add_url: 'article/add',
                        edit_url: 'article/edit',
                        del_url: 'article/del',
                    },
                    elem: '#table',
                    url: 'article/index',//数据接口
                    title: '文章',
                    toolbar: '#tool-bar',
                    cols: [[ //表头
                        {type: 'checkbox', width: '5%'},
                        {field: 'id', title: 'ID'},
                        {field: 'title', title: '标题', edit: 'text'},
                        {field: 'author', title: '作者', edit: 'text'},
                        {field: 'status', title: '状态', templet: '#status'},
                        {field: 'cover', title: '缩略图'},
                        {field: 'create_time', title: '创建时间'},
                        {field: 'right', title: '操作', toolbar: '#operate', fixed: 'right'},
                    ]]
                };
                Table.api.bindevent(option);
                Controller.api.bindevent();
            },
            add: function () {
                layui.use(['upload'], function () {
                    var upload = layui.upload,
                        url = "/admin/article/fileUpload";
                    var base64_result;
                    //封面上传
                    var uploadInst = upload.render({
                        elem: '#cover-upload'
                        , url: url
                        , multiple: false
                        , number: 1
                        , accept: 'images'
                        , acceptMime: 'image/*'
                        , before: function (obj) {
                            //预读本地文件示例，不支持ie8
                            console.log(obj);
                            obj.preview(function (index, file, result) {
                                // $('#cover-upload').attr('src', result); //图片链接（base64）
                                base64_result = result;
                            });

                        }
                        , done: function (res, index, upload) {
                            var cover_text = $('#cover-text');
                            if (res.code != '000000') {
                                cover_text.css('color', '#FF5722').css('position', 'relative').css('left', '-100px').prop('id', 'cover-reload').html('上传失败');
                                cover_text.find('#cover-reload').on('click', function () {
                                    uploadInst.upload();
                                });
                                return false;
                            } else {
                                // 表示上传成功
                                cover_text.css('color', '#FF5722').css('position', 'relative').css('left', '-100px').html('点击可重新上传');
                                var local_url = res.data.localUrl;
                                $("#cover").val(local_url);
                                $('#cover-upload').attr('src', base64_result);
                                base64_result = '';
                            }
                            //上传成功
                        }
                        , error: function () {
                            //演示失败状态，并实现重传
                            // var demo_text = $('#cover-text');
                            // demo_text.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                            // demo_text.find('.demo-reload').on('click', function () {
                            //     uploadInst.upload();
                            // });
                        }
                    });
                });
                Controller.events.tag();
                Controller.events.get_tag();
                Controller.api.bindevent();


            },
            edit: function () {
                layui.use(['upload'], function () {
                    var upload = layui.upload,
                        url = "/admin/article/fileUpload";
                    var base64_result;
                    //封面上传
                    var uploadInst = upload.render({
                        elem: '#cover-upload'
                        , url: url
                        , multiple: false
                        , number: 1
                        , accept: 'images'
                        , acceptMime: 'image/*'
                        , before: function (obj) {
                            //预读本地文件示例，不支持ie8
                            console.log(obj);
                            obj.preview(function (index, file, result) {
                                // $('#cover-upload').attr('src', result); //图片链接（base64）
                                base64_result = result;
                            });

                        }
                        , done: function (res, index, upload) {
                            var cover_text = $('#cover-text');
                            if (res.code != '000000') {
                                cover_text.css('color', '#FF5722').css('position', 'relative').css('left', '-100px').prop('id', 'cover-reload').html('上传失败');
                                cover_text.find('#cover-reload').on('click', function () {
                                    uploadInst.upload();
                                });
                                return false;
                            } else {
                                // 表示上传成功
                                cover_text.css('color', '#FF5722').css('position', 'relative').css('left', '-100px').html('点击可重新上传');
                                var local_url = res.data.localUrl;
                                $("#cover").val(local_url);
                                $('#cover-upload').attr('src', base64_result);
                                base64_result = '';
                            }
                            //上传成功
                        }
                        , error: function () {
                            //演示失败状态，并实现重传
                            // var demo_text = $('#cover-text');
                            // demo_text.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                            // demo_text.find('.demo-reload').on('click', function () {
                            //     uploadInst.upload();
                            // });
                        }
                    });
                });
                Controller.events.tag();
                Controller.events.get_tag();
                Controller.api.bindevent();
            },
            api: {
                bindevent: function () {
                    Controller.events.to_big();
                    Form.api.bindevent();
                },
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
                },
                tag: function () {
                    //显示隐藏
                    $(".show-labelitem").on("click", function () {
                        $(this).hide();
                        $(".hide-labelitem").show();
                        $("#label-item").show();
                    });
                    //显示隐藏
                    $(".hide-labelitem").on("click", function () {
                        $(this).hide();
                        $(".show-labelitem").show();
                        $("#label-item").hide();
                    });
                    //点击选择 并赋值
                    $("#label-item-ul").on("click", "li", function () {
                        if ($(this).hasClass("selected")) {
                            return false;
                        }
                        var select_li = $("#label-selected-ul").children("li");
                        if (select_li.length >= 10) {
                            layer.msg('最多可选择10个', {icon: 5});
                            return false;
                        }
                        var id = $(this).attr("data");
                        var text = $(this).html();
                        var label_html = "<li data='" + id + "''>x " + text + "</li>";
                        $("#label-selected-ul").append(label_html);
                        var val = [];
                        //获取选中的标签 - 重新赋值
                        $.each($("#label-selected-ul").children("li"), function (k, v) {
                            val.push($(v).attr("data"));
                        });

                        $("#hidden-val").val(val);
                        $(this).addClass("selected");
                    });
                    //点击删除 并重新赋值
                    $("#label-selected-ul").on("click", "li", function () {
                        var id = $(this).attr("data");
                        $(this).remove();
                        var val = [];
                        var select_li = $(" #label-selected-ul").children("li");
                        //获取选中的标签 - 重新赋值
                        $.each(select_li, function (k, v) {
                            val.push($(v).attr("data"));
                        });

                        $("#hidden-val").val(val);
                        $("#label-item-ul").find("li[data='" + id + "']").removeClass("selected");
                    });
                    //点击更换标签
                    $(".replace-lable").on("click", function () {
                        Controller.events.get_tag();
                    });
                    //新增标签
                    $(".enter-input").on('keyup', function (event) {
                        console.log(event);
                        if (event.keyCode == 13) {
                            if ($(" #label-selected-ul").children("li").length >= 10) {
                                layer.msg('您已选择10个标签,无法继续添加');
                                return false;
                            }
                            var value = $(this).val();
                            lucklyJack.api.ajax({
                                url: '/admin/tag/add',
                                data: {name: value},
                                type: "POST",
                                dataType: "json",
                            }, false, function (data, ret) {

                                var label_html = "<li data='" + data + "''>x " + value + "</li>";
                                $("#label-selected-ul").append(label_html);
                                var val = [];
                                $.each($(" #label-selected-ul").children("li"), function (k, v) {
                                    val.push($(v).attr("data"));
                                });
                                $("#hidden-val").val(val);
                                //清空
                                $('.enter-input').val('');
                            }, function (data, ret) {
                                layer.msg(ret.msg, {icon: 5});
                            });

                        }
                    });

                },
                get_tag: function () {
                    lucklyJack.api.ajax('/admin/tag/getRandTagList', false, function (data, ret) {
                        $("#label-item-ul").empty();
                        var html = '';
                        var val_str = $("#hidden-val").val();
                        var val_list = [];
                        if (val_str != '') {
                            val_list = val_str.split(',');
                        }
                        //判断重新选出来的是否已经被选定
                        $.each(data, function (k, v) {
                            var classes = '';
                            if ($.inArray(v.id.toString(), val_list) >= 0) {
                                classes = 'selected';
                            }
                            html += '<li class="' + classes + '" data="' + v.id + '">' + v.name + '</li>';
                        });
                        $("#label-item-ul").append(html);
                    }, function (data, ret) {
                        layer.msg(ret.msg);
                        return false;
                    });
                }
            }

        }
    ;
    return Controller;

});