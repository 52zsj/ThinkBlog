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
                    Form.api.bindevent();
                },
            },
            events: {

            }

        }
    ;
    return Controller;

});