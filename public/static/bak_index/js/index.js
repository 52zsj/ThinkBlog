define(['jquery', 'layui', 'template'], function ($, layui, template) {
    var Controller = {
        index: function () {
            Controller.events.search();
            Controller.events.lay_carousel();
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
            lay_page: function (offset = '') {
                layui.use('laypage', function () {
                    var laypage = layui.laypage;
                    //执行一个laypage实例
                    var keyword = $("#keyword").val();
                    //严格点
                    offset = offset == '' ? 1 : offset;
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
                            // htmls = '<div style=" text-align: center;color: red;line-height: 350px;font-size: 25px;">暂无文章内容</div>';
                            $("#pagelist").empty();
                        }
                        $("#article-item-list").html(htmls);

                        //重新渲染
                        Controller.events.random_color();
                        common.events.leftScroll();
                        common.events.noImage();
                        Controller.events.time_out();
                    });
                });

            },
            lay_carousel: function () {
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
            search: function () {
                $("#search").click(function () {
                    if ($(this).hasClass('not-click')) {
                        layer.msg('您的手速也太快了吧~臣妾受不了啊~3秒后可以继续搜索', {icon: 5});
                        return false;
                    }
                    var keyword = $("#keyword").val();
                    if (keyword == '') {
                        layer.msg('搜索关键字不能为空！', {icon: 5});
                        return false;
                    }
                    //如果执行至此说明成功走过之前测试
                    $(this).addClass('not-click');
                    Controller.events.lay_page();
                });
            },
            time_out: function () {
                setTimeout(function () {
                    $("#search").removeClass('not-click');
                }, 3000);
            }
        }

    };
    return Controller;

});