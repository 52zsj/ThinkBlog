define(['xadmin', 'form', 'jack.table', 'template'], function (xadmin, Form, Table, template) {
    var Controller = {
            index: function () {
                var option = {
                    url_list: {
                        index_url: 'menu/index',
                        add_url: 'menu/add',
                        edit_url: 'menu/edit',
                        del_url: 'menu/del',
                    },
                    is_tree: true,
                    elem: '#table',
                    url: 'menu/index',//数据接口
                    title: '后台菜单',
                    toolbar: '#tool-bar',
                    page: false,
                    cols: [[ //表头
                        {type: 'checkbox', width: '5%'},
                        {field: 'id', title: 'ID'},
                        {field: 'title', title: '内容'},
                        {field: 'url', title: '路径'},
                        {field: 'icon', title: '图标', templet: '#icon'},
                        {field: 'create_time', title: '创建时间'},
                        {field: 'update_time', title: '创建时间'},
                        {field: 'right', title: '操作', toolbar: '#operate', fixed: 'right'},
                    ]],

                };
                Table.api.bindevent(option);

                Controller.api.bindevent();
            },
            add: function () {

                Controller.api.bindevent();
                Controller.events.icon_search();

            },
            edit: function () {
                Controller.api.bindevent();
                Controller.events.icon_search();

            },
            api: {
                bindevent: function () {
                    Form.api.bindevent();
                },
            },
            events: {
                icon_search: function () {
                    var icon_list = [];
                    var open_index;
                    var iconfunc = function () {
                        open_index = Layer.open({
                            type: 1,
                            area: ['99%', '98%'], //宽高
                            content: template('choose_icon', {icon_list: icon_list})
                        });
                    };
                    $(document).on('click', ".btn-search-icon", function () {
                        if (icon_list.length == 0) {
                            $.get("/static/libs/font-awesome/less/variables.less", function (ret) {
                                var exp = /fa-var-(.*):/ig;
                                var result;
                                while ((result = exp.exec(ret)) != null) {
                                    icon_list.push(result[1]);
                                }
                                console.log(icon_list);
                                iconfunc();

                            });
                        } else {
                            iconfunc();
                        }
                    });
                    $(document).on('click', '#chooseicon ul li', function () {
                        $("input[name='icon']").val('fa fa-' + $(this).data("font"));
                        Layer.close(open_index);
                    });
                    $(document).on('keyup', 'input.js-icon-search', function () {
                        $("#chooseicon ul li").show();
                        if ($(this).val() != '') {
                            $("#chooseicon ul li:not([data-font*='" + $(this).val() + "'])").hide();
                        }
                    });
                }
            }

        }
    ;
    return Controller;

});