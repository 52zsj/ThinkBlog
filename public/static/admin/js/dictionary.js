define(['xadmin', 'form'], function (xadmin, Form) {
    var Controller = {
            index: function () {
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