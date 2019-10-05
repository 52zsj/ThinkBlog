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
                        {field: 'conver', title: '缩略图'},
                        {field: 'create_time', title: '创建时间'},
                        {field: 'right', title: '操作', toolbar: '#operate', fixed: 'right'},
                    ]]
                };
                Table.api.bindevent(option);
                Controller.api.bindevent();
            },
            add: function () {
                Controller.events.tag();
                Controller.events.get_tag();
                Controller.api.bindevent();

            },
            edit: function () {
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
                    //获取标签
                    $("#cell").on("click", function () {
                        if ($("input[name='label']").val() == "") {
                            return false;
                        } else {
                            layer.msg("标签内容为：" + $("input[name='label']").val());
                        }
                    })
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