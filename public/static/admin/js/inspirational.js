define(['xadmin', 'form', 'jack.table'], function (xadmin, Form, Table) {
    var Controller = {
            index: function () {
                var option = {
                    url_list: {
                        index_url: 'inspirational/index',
                        add_url: 'inspirational/add',
                        edit_url: 'inspirational/edit',
                        del_url: 'inspirational/del',
                    },
                    elem: '#table',
                    url: 'inspirational/index',//数据接口
                    title: '每日一句',
                    toolbar: '#tool-bar',
                    cols: [[ //表头
                        {type: 'checkbox', width: '5%'},
                        {field: 'id', title: 'ID'},
                        {field: 'content', title: '内容'},
                        {field: 'create_time', title: '创建时间'},
                        {field: 'update_time', title: '创建时间'},
                        {field: 'right', title: '操作', toolbar: '#operate', fixed: 'right'},
                    ]]
                };
                Table.api.bindevent(option);

                Controller.api.bindevent();
            },
            add: function () {
                Controller.api.bindevent();

            },
            edit: function () {
                Controller.api.bindevent();

            },
            api: {
                bindevent: function () {
                    Form.api.bindevent();
                },
            },
            events: {

            }

        }
    ;
    return Controller;

});