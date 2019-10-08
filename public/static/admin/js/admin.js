define(['xadmin', 'form', 'jack.table'], function (xadmin, Form, Table) {
    var Controller = {
            index: function () {
                var option = {
                    url_list: {
                        index_url: 'admin/index',
                        add_url: 'admin/add',
                        edit_url: 'admin/edit',
                        del_url: 'admin/del',
                    },
                    elem: '#table',
                    url: 'admin/index',//数据接口
                    title: '管理员',
                    toolbar: '#tool-bar',
                    cols: [[ //表头
                        {type: 'checkbox', width: '5%'},
                        {field: 'id', title: 'ID'},
                        {field: 'user_name', title: '用户名'},
                        {field: 'nick_name', title: '昵称', edit: 'text'},
                        {field: 'join_ip', title: '加入ip'},
                        {field: 'status', title: '状态', templet: '#status'},
                        {field: 'create_time', title: '创建时间'},
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