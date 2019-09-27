define(['xadmin', 'form'], function (xadmin, Form) {
    var Controller = {
            index: function () {
                Controller.api.bindevent();
                var cateIds = [];
                $("tbody.x-cate tr[fid!='0']").hide();
                // 栏目多级显示效果
                Controller.events.show_change();
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
                //列表页数显示树状
                get_cate_id: function (cateIds = [], cateId) {
                    $("tbody tr[fid=" + cateId + "]").each(function (index, el) {
                        id = $(el).attr('cate-id');
                        cateIds.push(id);
                        Controller.events.get_cate_id(cateIds, id);
                    });
                },
                show_change: function () {
                    $('.x-show').click(function () {
                        if ($(this).attr('status') == 'true') {
                            $(this).html('&#xe625;');
                            $(this).attr('status', 'false');
                            cateId = $(this).parents('tr').attr('cate-id');
                            $("tbody tr[fid=" + cateId + "]").show();
                        } else {
                            cateIds = [];
                            $(this).html('&#xe623;');
                            $(this).attr('status', 'true');
                            cateId = $(this).parents('tr').attr('cate-id');
                            Controller.events.get_cate_id(cateIds, cateId);
                            for (var i in cateIds) {
                                $("tbody tr[cate-id=" + cateIds[i] + "]").hide().find('.x-show').html('&#xe623;').attr('status', 'true');
                            }
                        }
                    });
                }
            }

        }
    ;
    return Controller;

});