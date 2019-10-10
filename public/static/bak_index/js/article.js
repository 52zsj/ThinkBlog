define(['jquery', 'layui', 'template'], function ($, layui, template) {
    var Controller = {
        detail: function () {

            Controller.api.bindevent();
        },

        api: {
            bindevent: function () {
                common.events.noImage();
            },

            get_request_url: function () {
                return Config.request_url;
            },
        },
        events: {

        }

    };
    return Controller;

});