define(['xadmin'], function (xadmin) {
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
                    Controller.events.to_big();
                }

            },
            events: {
                to_big: function () {
                    $(document).on('click', '.to-big', function () {
                        var url = $(this).attr('src');
                        var img_html = "<img style='width: 100%' src='" + url + "'/>";
                        layer.open(
                            {
                                type: 1,
                                title: false,
                                content: img_html,
                                closeBtn: 2,
                                anim: 2,
                            }
                        )
                    });
                }
            }

        }
    ;
    return Controller;

});