define(['jquery', 'scrollreveal', 'layui', 'template'], function ($, scrollreveal, layui, template) {
    var Controller = {
        index: function () {
            var page_data = Controller.api.get_page_data();
            var total = page_data.total;
            Controller.events.lay_page(total);

        },
        detail: function () {
            //引入相册展示插件JS
            require(['albumplugin'], function (albumplugin) {
            });
        },
        api: {
            bindevent: function () {
            },
            get_page_data: function () {
                return Config.page_data;
            },
        },
        events: {
            lay_page: function (total = 0) {
                if (total > 0) {
                    layui.use('laypage', function () {
                        var laypage = layui.laypage;
                        //执行一个laypage实例
                        laypage.render({
                            elem: 'pagelist' //注意，这里的 test1 是 ID，不用加 # 号
                            , count: total //数据总数，从服务端得到
                            , limit: 8
                            , theme: '#1E9FFF'
                            , curr: location.hash.replace('#!page=', '') //获取hash值为page的当前页
                            , hash: 'page' //自定义hash值
                            , jump: function (obj) {
                                var offset = obj.curr;//当前页
                                lucklyJack.api.ajax({
                                    url: 'album.html',
                                    type: "POST",
                                    data: {offset: offset},
                                    loading: false,
                                }, false, function (res) {
                                    var htmls = template('album-item', res);
                                    console.log(htmls);
                                    $("#picbox").html(htmls);
                                });
                            }

                        });
                    });
                } else {
                    var htmls = '<div style=" text-align: center;color: red;line-height: 350px;font-size: 25px;">相册内容为空...</div>';
                    $("#picbox").html(htmls);
                }
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