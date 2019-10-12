define(['jquery', 'scrollreveal', 'layui', 'template', 'swipebox'], function ($, scrollreveal, layui, template, swipebox) {
    var Controller = {
        index: function () {
            Controller.events.lay_page();
        },
        detail: function () {
            //引入相册展示插件JS
            /* require(['albumplugin'], function (albumplugin) {
             });*/
           /* require(['swipebox'], function (swipebox) {
                $('.swipeboxEx').each(function (i, el) {
                    var id = $(el).data('id');
                    console.log(".swipebox" + id);
                    console.log(id);
                    $(".swipebox" + id).swipebox({
                        useCSS: true, // false will force the use of jQuery for animations
                        useSVG: true, // false to force the use of png for buttons
                        initialIndexOnArray: 0, // which image index to init when a array is passed
                        hideCloseButtonOnMobile: false, // true will hide the close button on mobile devices
                        removeBarsOnMobile: true, // false will show top bar on mobile devices
                        hideBarsDelay: 3000, // delay before hiding bars on desktop
                        videoMaxWidth: 1140, // videos max width
                        beforeOpen: function () {
                        }, // called before opening
                        afterOpen: null, // called after opening
                        afterClose: function () {
                        }, // called after closing
                        loopAtEnd: false // true will return to the first image after the l
                    });
                });
                /!*     $(".swipebox").swipebox({
                         useCSS : true, // false will force the use of jQuery for animations
                         useSVG : true, // false to force the use of png for buttons
                         initialIndexOnArray : 0, // which image index to init when a array is passed
                         hideCloseButtonOnMobile : false, // true will hide the close button on mobile devices
                         removeBarsOnMobile : true, // false will show top bar on mobile devices
                         hideBarsDelay : 3000, // delay before hiding bars on desktop
                         videoMaxWidth : 1140, // videos max width
                         beforeOpen: function() {}, // called before opening
                         afterOpen: null, // called after opening
                         afterClose: function() {}, // called after closing
                         loopAtEnd: false // true will return to the first image after the l
                     });*!/
            })*/
        },
        api: {
            bindevent: function () {
            },
            get_request_url: function () {
                return Config.request_url;
            },
        },
        events: {
            lay_page: function (offset = '') {
                layui.use('laypage', function () {
                    var laypage = layui.laypage;
                    //严格点
                    offset = offset == '' ? 1 : offset;
                    lucklyJack.api.ajax({
                        url: Controller.api.get_request_url(),
                        type: "POST",
                        data: {offset: offset},
                        loading: false,
                    }, false, function (data) {
                        var htmls = template('album-item', data);
                        var limit = data.limit;
                        var total = data.total;
                        if (total > limit) {
                            laypage.render({
                                elem: 'pagelist', //注意，这里的 test1 是 ID，不用加 # 号
                                count: total,//数据总数，从服务端得到
                                limit: limit,
                                theme: '#1E9FFF',
                                curr: location.hash.replace('#!page=', ''),//获取起始页
                                hash: 'page', //自定义hash值
                                jump: function (obj, first) {
                                    var offset = obj.curr;//当前页
                                    if (!first) {
                                        Controller.events.lay_page(offset);
                                    }
                                }
                            });
                        } else {
                            $("#pagelist").empty();
                        }
                        $("#picbox .row").html(htmls);

                        common.events.no_image();
                        common.events.tool_tip();
                        require(['swipebox'], function (swipebox) {
                            $('.swipeboxEx').each(function (i, el) {
                                var id = $(el).data('id');
                                $(".swipebox" + id).swipebox({
                                    useCSS: true, // false will force the use of jQuery for animations
                                    initialIndexOnArray: 0, // which image index to init when a array is passed
                                    removeBarsOnMobile: true, // false will show top navigation bar on mobile devices
                                    hideCloseButtonOnMobile: false, // true will hide the close button on mobile devices
                                    hideBarsDelay: 3000, // delay before hiding bars on desktop
                                    videoMaxWidth: 1140, // videos max width
                                    beforeOpen: function () {
                                    }, // called before opening
                                    afterOpen: null, // called after opening
                                    afterClose: function () {
                                        console.log('关闭？');
                                        var player = $("#music" + id)[0];
                                        player.pause(); /*播放*/
                                    }, // called after closing
                                    afterMedia: function () {
                                        var player = $("#music" + id)[0];
                                        if (player.paused) {
                                            player.play(); /*播放*/
                                        }
                                    }, // called after media is loaded
                                    loopAtEnd: true, // true will return to the first image after the last image is reached
                                    autoplayVideos: false, // true will autoplay Youtube and Vimeo videos
                                    queryStringData: {}, // plain object with custom query string arguments to pass/override for video URLs,
                                    toggleClassOnLoad: '', // CSS class that can be toggled when the slide will be loaded (like 'hidden' of Bootstrap)
                                    useSVG: true
                                });
                            });
                        })

                    }, function (data, ret) {
                        layer.msg(ret.msg, {icon: 5}, function () {
                            location.href = ret.jump_url;
                        });

                    });
                    return false;
                });

            },
            animation: function (tag) {
                window.sr = scrollreveal({reset: true});
                sr.reveal(tag, {
                    // 动画的时长
                    duration: 1000,
                    // 延迟时间
                    delay: 500,
                    // 动画开始的位置，'bottom', 'left', 'top', 'right'
                    origin: 'bottom',
                    // 回滚的时候是否再次触发动画
                    reset: false,
                    // 在移动端是否使用动画
                    mobile: true,
                    // 滚动的距离，单位可以用%，rem等
                    distance: '24px',
                    // 其他可用的动画效果
                    opacity: 0.001,

                    /*      rotate: {
                              x: 50,
                              y: 50,
                              z: 50
                          },*/
                    easing: 'linear',
                    scale: 0.9,
                });
            },

        }
    };

    return Controller;

});