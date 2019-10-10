define(['jquery', 'hcsticky','bootstrap'], function ($) {
    var common = {
        events: {
            //返回最上层
            go_top: function () {
                //回到顶部
                $(window).scroll(function () {
                    if ($(window).scrollTop() > 100) {
                        $(".gotop").fadeIn();
                    } else {
                        $(".gotop").hide();
                    }
                });
                $(".gotop").click(function () {
                    $('html,body').animate({'scrollTop': 0}, 500);
                });
            },
            //图片丢失时触发
            no_image: function () {
                document.addEventListener("error", function (e) {
                    var elem = e.target;
                    if (elem.tagName.toLowerCase() == 'img') {
                        elem.src = "/static/index/images/no-img.jpg";
                        elem.title = '图片丢了~~';
                    }
                }, true);
            },
            //标签颜色随机
            random_color: function () {
                var colorList = ["#9dc6eb", "#f8c471", "#b9a3ef", "#fdb1ca", "#9dc6eb", "#f8c471", "#b9a3ef", "#fdb1ca"];
                if ($(".tag").length > 0) {
                    $('.tag').each(function (k, v) {
                        $(v).css('background', colorList[common.api.random(0, 7)]);
                    });
                }
            },
            //元素随页面滚动改变位置 默认搜索框
            smart_float: function (obj = "#search-box") {
                var element = typeof obj == 'object' ? obj : $(obj);
                if (element.length > 0) {
                    var top = element.offset().top; //当前元素对象element距离浏览器上边缘的距离
                    var pos = element.css("position"); //当前元素距离页面document顶部的距离
                    $(window).scroll(function () { //侦听滚动时
                        var scrolls = $(this).scrollTop();
                        if (scrolls > top) { //如果滚动到页面超出了当前元素element的相对页面顶部的高度
                            if (window.XMLHttpRequest) { //如果不是ie6
                                element.css({ //设置css
                                    position: "fixed", //固定定位,即不再跟随滚动
                                    top: 0 //距离页面顶部为0
                                }).addClass("shadow"); //加上阴影样式.shadow
                            } else { //如果是ie6
                                element.css({
                                    top: scrolls  //与页面顶部距离
                                });
                            }
                        } else {
                            element.css({ //如果当前元素element未滚动到浏览器上边缘，则使用默认样式
                                position: pos,
                                top: top
                            }).removeClass("shadow");//移除阴影样式.shadow
                        }
                    });
                }
            },
            //取消search样式
            time_out: function () {
                setTimeout(function () {
                    $("#search,#m-search").removeClass('not-click');
                }, 3000);
            },
            //tooltip
            tool_tip: function () {
                if ($('[data-toggle="popover"]').length > 0) {
                    $('[data-toggle="popover"]').popover();
                }
                if ($('[data-toggle="tooltip"]').length > 0) {
                    $('[data-toggle="tooltip"]').tooltip();
                }
            },

        },
        api: {
            bindevent: function () {
                common.events.go_top();
                common.events.random_color();
                common.events.smart_float();
                common.events.no_image();
                common.events.tool_tip();
            },
            random: function (min, max) {
                return Math.floor(Math.random() * (max - min) + min);
            },
        },
    };
    //直接加载
    common.api.bindevent();
    return common;
});