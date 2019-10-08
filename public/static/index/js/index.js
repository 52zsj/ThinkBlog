define(['jquery', 'layui', 'template'], function ($, layui, template) {
    var Controller = {
        index: function () {
            Controller.events.lay_page();
            $("#search").click(function () {
                if ($("#keyword").val() == '') {
                    layer.msg('搜索关键字不能为空！', {icon: 5});
                    return false;
                }
                Controller.events.lay_page();
            });
            layui.use('carousel', function () {
                var carousel = layui.carousel;
                //建造实例
                carousel.render({
                    elem: '#layui-carousel',
                    width: '100%', //设置容器宽度
                    arrow: 'hover', //始终显示箭头
                    anim: 'default', //切换动画方式
                    indicator: 'none',
                    autoplay: true,
                });
            });
        },

        api: {
            bindevent: function () {
            },

            get_request_url: function () {
                return Config.request_url;
            }
        },
        events: {
            lay_page: function (offset = 1) {
                layui.use('laypage', function () {
                    var laypage = layui.laypage;
                    //执行一个laypage实例
                    var keyword = $("#keyword").val();
                    lucklyJack.api.ajax({
                        url: Controller.api.get_request_url(),
                        type: "POST",
                        data: {offset: offset, keyword: keyword},
                        loading: false,
                    }, false, function (data) {
                        var htmls = template('article-item', data);
                        var limit = data.limit;
                        var total = data.total;
                        if (keyword != '') {
                            $("#show-search").removeClass('layui-hide').text('搜索 "' + keyword + '" 总共：' + total + '条');
                        } else {
                            $("#show-search").addClass('layui-hide').text('')
                        }
                        if (total > 0) {
                            laypage.render({
                                elem: 'pagelist' //注意，这里的 test1 是 ID，不用加 # 号
                                , count: total//数据总数，从服务端得到
                                , limit: limit
                                , theme: '#1E9FFF'
                                , curr: location.hash.replace('#!page=', '') //获取hash值为page的当前页
                                , hash: 'page' //自定义hash值
                                , jump: function (obj, first) {
                                    var offset = obj.curr;//当前页
                                    if (!first) {
                                        Controller.events.lay_page(offset, keyword);
                                    }

                                }
                            });
                        } else {
                            // htmls = '<div style=" text-align: center;color: red;line-height: 350px;font-size: 25px;">暂无文章内容</div>';
                            $("#pagelist").empty();
                        }
                        $("#article-item-list").html(htmls);

                        //重新渲染
                        common.events.leftScroll();
                        common.events.noImage();
                    });
                });

            },
        }
    };
    return Controller;

});