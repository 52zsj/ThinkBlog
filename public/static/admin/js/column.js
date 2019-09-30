define(['xadmin', 'form', 'jack.table'], function (xadmin, Form, Table) {
    var Controller = {
            index: function () {
                Controller.api.bindevent();

                var option = {
                    url_list: {
                        index_url: 'column/index',
                        add_url: 'column/add',
                        edit_url: 'column/edit',
                        del_url: 'column/del',
                    },
                    elem: '#table',
                    url: 'column/index',//数据接口
                    is_tree: true,
                    title: '分类',
                    toolbar: '#tool-bar',
                    page: false,
                    cols: [[ //表头
                        {type: 'checkbox', width: '5%'},
                        {field: 'id', title: 'ID'},
                        {field: 'name', title: '名称',edit:'text'},
                        {field: 'status', title: '状态', toolbar: '#status'},
                        {field: 'order_key', title: '排序', edit: 'text'},
                        {field: 'right', title: '操作', toolbar: '#operate', fixed: 'right'},
                    ]]
                };
                Table.api.bindevent(option);
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
            events: {}

        }
    ;
    return Controller;

});