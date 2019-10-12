define(['xadmin', 'form', 'jack.table'], function (xadmin, Form, Table) {
    var Controller = {
            index: function () {
                var option = {
                    url_list: {
                        index_url: 'front_menu/index',
                        add_url: 'front_menu/add',
                        edit_url: 'front_menu/edit',
                        del_url: 'front_menu/del',
                    },
                    elem: '#table',
                    url: 'front_menu/index',//数据接口
                    title: '前台菜单',
                    toolbar: '#tool-bar',
                    cols: [[ //表头
                        {type: 'checkbox', width: '5%'},
                        {field: 'id', title: 'ID'},
                        {field: 'name', title: '内容'},
                        {field: 'url', title: '路径'},
                        {field: 'icon', title: '图标',templet: '#icon'},
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