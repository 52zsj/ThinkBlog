define(['jquery', 'layui'], function ($, layui) {
    var Table = {
        //基础配置
        default: {
            url_list: {
                index_url: '',
                add_url: '',
                edit_url: '',
                del_url: '',
                detail_url: '',
            },
            pk: 'id',
            elem: '#table',
            url: '',
            toolbar: true,
            width: '',
            height: '',
            cellMinWidth: '60',
            page: {
                layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'],
                first: false,
                last: false,
                prev: '上一页',
                next: '下一页',
            },
            loading: true,
            title: '',
            text: '',
            autoSort: true,
            initSort: '',
            id: 'table',
            skin: '',
            cols: [],
            even: true,
            size: '',

            done: function (res, curr, count) {
                //如果是异步请求数据方式，res即为你接口返回的信息。
                //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
                console.log(res);

                //得到当前页码
                console.log(curr);

                //得到数据总量
                console.log(count);
            }
        },
        //字段列表
        api: {
            bindevent: function (defaults) {
                var table = Table.init();
                var options = Table.merage_config(defaults);
                table.render(options);
                //编辑删除等吧
                table.on('tool(table)', function (obj) {
                    var event = obj.event;
                    var id = obj.data.id;
                    switch (event) {
                        case 'edit':
                            var url = options.url_list.edit_url + '/id/' + id;
                            xadmin.open('编辑', url);
                            break;
                        case 'del':
                            var url = options.url_list.del_url;
                            layer.confirm('确认要删除吗？', function (index) {
                                lucklyJack.api.ajax({
                                    type: 'POST',
                                    url: url,
                                    data: {id: id},
                                    dataType: 'JSON'
                                }, false, function (data, res) {
                                    layer.msg(res.msg, {icon: 6}, function () {
                                        if (res.jump_url != '') {
                                            window.location.href = res.jump_url;
                                        }
                                        //关闭当前frame
                                        xadmin.close();
                                        table.reload('table', {
                                            page: {
                                                curr: 1 //重新从第 1 页开始
                                            }
                                        });
                                    });
                                }, function (data, res) {
                                    layer.msg(res.msg, {shift: -1, icon: 5}, function () {
                                        if (res.jump_url != '') {
                                            window.location.href = res.jump_url;
                                        }
                                    });
                                    return false;
                                });
                                return false;
                            });
                            break;
                        case 'detail':
                            var url = options.url_list.detail_url + '/id/' + id;
                            xadmin.open('详情', url);
                            break;
                    }
                });
                //行内编辑
                table.on('edit(table)', function (obj) {
                    var value = obj.value, //得到修改后的值
                        id = obj.data.id,
                        field = obj.field; //得到字段
                    var url = options.url_list.edit_url + '/' + field + '/' + value + '/id/' + id;
                    lucklyJack.api.ajax(url, false, function (data, res) {
                        layer.msg(res.msg, {icon: 6});
                    }, function (data, res) {
                        layer.msg(res.msg, {icon: 5});
                    });
                });
                //编辑
                table.on('toolbar(table)', function (obj) {
                    //获取选中
                    console.log(obj.event);
                    switch (obj.event) {
                        case 'add':
                            var url = options.url_list.add_url;
                            xadmin.open('添加', url);
                            break;
                        case 'del---':
                            console.log('del');
                            break;
                        case 'edit---':
                            console.log('edit');
                            break;
                    }
                    ;
                });
                //状态选择
                table.on('checkbox(table)', function (obj) {
                    //判断当前是全选还是单选则
                    var length = $("input[name='layTableCheckbox']:checked").length;
                    if (length > 0) {
                        $("#jack-edit,#jack-del").removeClass('layui-btn-disabled').attr('disabled', false);
                    } else {
                        $("#jack-edit,#jack-del").addClass('layui-btn-disabled').attr('disabled', true);
                    }
                });

                return table;
            }
        },
        merage_config: function (defaults) {
            //合并属性
            $.extend(true, Table.default, defaults);
            return Table.default;
        },
        init: function () {
            var table = null;
            layui.use(['table'], function () {
                table = layui.table;
            });
            return table;
        }
    };
    return Table;

});