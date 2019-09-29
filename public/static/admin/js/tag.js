define(['xadmin', 'form', 'jack.table'], function (xadmin, Form, Table) {
    var Controller = {
            index: function () {
                var option = {
                    url_list: {
                        index_url: 'tag/index',
                        add_url: 'tag/add',
                        edit_url: 'tag/edit',
                        del_url: 'tag/del',
                    },
                    elem: '#table',
                    url: 'tag/index',//数据接口
                    title: '标签',
                    toolbar:'#tool-bar',
                    cols: [[ //表头
                        {type: 'checkbox', width: '5%'},
                        {field: 'id', title: 'ID'},
                        {field: 'name', title: '名称', edit: 'text'},
                        {field: 'status', title: '状态'},
                        {field: 'order_key', title: '排序', edit: 'number'},
                        {field: 'create_time', title: '创建时间'},
                        {field: 'right', title: '操作', toolbar: '#operate'},
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