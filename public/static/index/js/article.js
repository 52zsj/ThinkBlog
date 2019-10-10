define(['jquery', 'layui', 'template'], function ($, layui, template) {
    var Controller = {
        detail: function () {
            Controller.api.bindevent();
            $(".related-content ul li").hover(function () {
                $(this).find("h3").show();
            }, function () {
                $(this).find("h3").hide();
            });
        },

        api: {
            bindevent: function () {
                common.events.no_image();
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