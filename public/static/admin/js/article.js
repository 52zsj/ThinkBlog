define(['xadmin', 'form', 'jack.table','tagit'], function (xadmin, Form, Table,tagit) {
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
                $("#myTags").tagit();
                Controller.api.bindevent();

            },
            edit: function () {
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
                }
            }

        }
    ;
    return Controller;

});