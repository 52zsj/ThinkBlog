define(['xadmin', 'form', 'jack.table'], function (xadmin, Form, Table) {
    var Controller = {
            index: function () {
                var option = {
                    url_list: {
                        index_url: 'dictionary/index',
                        add_url: 'dictionary/add',
                        edit_url: 'dictionary/edit',
                        del_url: 'dictionary/del',
                    },
                    elem: '#table',
                    url: 'dictionary/index',//数据接口
                    title: '字典',
                    toolbar: '#tool-bar',
                    cols: [[ //表头
                        {type: 'checkbox', width: '5%'},
                        {field: 'id', title: 'ID'},
                        {field: 'name', title: '显示名', edit: 'text'},
                        {field: 'en_name', title: '标识', edit: 'text'},
                        {field: 'value', title: '值', edit: 'text'},
                        {field: 'order_key', title: '排序', edit: 'text'},
                        {field: 'status', title: '状态',templet: '#status'},
                        {field: 'group', title: '分组', edit: 'text'},
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
                    Controller.events.can_click();
                    Controller.events.check_editor();
                    Form.api.bindevent();
                },
            },
            events: {
                can_click: function () {
                    $(document).on('click', '.x-red .can-click', function () {
                        var value = $(this).data('value');
                        $("input[name='group']").val(value);
                    });
                },
                check_editor: function () {
                    var form = Form.init();
                    form.on('checkbox(check)', function (data) {
                        if (data.elem.checked) {
                            console.log('选中');
                            //选中显示ueditor
                            $("#check-editor").removeClass('layui-hide').children().find('textarea').prop('disabled', false);
                            $("#check-input").addClass('layui-hide').children().find('input').prop('disabled', true);
                        } else {
                            $("#check-input").removeClass('layui-hide').children().find('input').prop('disabled', false);
                            $("#check-editor").addClass('layui-hide').children().find('textarea').prop('disabled', true);
                        }
                    })
                }
            }

        }
    ;
    return Controller;

});