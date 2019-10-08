define(['jquery', 'hcsticky'], function ($) {
    var common = {
        events: {
            //自适应手机版导航
            mobileNav: function () {
                $("#mnavh").click(function () {
                    $("#starlist").toggle();
                    $("#mnavh").toggleClass("open");
                });
            },
            //页面滚动 隐藏头部
            bodyScroll: function () {

                var new_scroll_position = 0;
                var last_scroll_position;
                var header = document.getElementById("header");

                window.addEventListener('scroll', function (e) {
                    last_scroll_position = window.scrollY;

                    // Scrolling down
                    if (new_scroll_position < last_scroll_position && last_scroll_position > 80) {
                        // header.removeClass('slideDown').addClass('slideUp');
                        header.classList.remove("slideDown");
                        header.classList.add("slideUp");

                        // Scrolling up
                    } else if (new_scroll_position > last_scroll_position) {
                        // header.removeClass('slideUp').addClass('slideDown');
                        header.classList.remove("slideUp");
                        header.classList.add("slideDown");
                    }

                    new_scroll_position = last_scroll_position;
                });
            },
            //左侧内容随页面滚动
            leftScroll: function () {
                //侧栏固定 跟随
                //aside
                var Sticky = new hcSticky('aside', {
                    stickTo: 'main',
                    innerTop: 200,
                    followScroll: false,
                    queries: {
                        480: {
                            disable: true,
                            stickTo: 'body'
                        }
                    }
                });
            },
            //返回最上层
            goTop: function () {
                //回到顶部
                // browser window scroll (in pixels) after which the "back to top" link is shown
                var offset = 300,
                    //browser window scroll (in pixels) after which the "back to top" link opacity is reduced
                    offset_opacity = 1200,
                    //duration of the top scrolling animation (in ms)
                    scroll_top_duration = 700,
                    //grab the "back to top" link
                    $back_to_top = $('.cd-top');

                //hide or show the "back to top" link
                $(window).scroll(function () {
                    ($(this).scrollTop() > offset) ? $back_to_top.addClass('cd-is-visible') : $back_to_top.removeClass('cd-is-visible cd-fade-out');
                    if ($(this).scrollTop() > offset_opacity) {
                        $back_to_top.addClass('cd-fade-out');
                    }
                });
                //smooth scroll to top
                $back_to_top.on('click', function (event) {
                    event.preventDefault();
                    $('body,html').animate({
                            scrollTop: 0,
                        }, scroll_top_duration
                    );
                });

            },
            //导航自动变换颜色
            navColor: function () {
                var obj = null;
                //  console.log(document.getElementById('starlist').getElementsByTagName('a'));
                var As = $("#starlist").children().find('a');// document.getElementById('starlist').getElementsByTagName('a');
                // console.log('aaaaaaaaaaaa***************sssssssssssss');
                // console.log(As);
                obj = As[0];
                for (i = 1; i < As.length; i++) {
                    if (window.location.href.indexOf(As[i].href) >= 0)
                        obj = As[i];
                }
                obj.id = 'selected';
            },
            //图片丢失时触发
            noImage: function () {
                document.addEventListener("error", function (e) {
                    var elem = e.target;
                    if (elem.tagName.toLowerCase() == 'img') {
                        elem.src = "/static/index/images/no-img.jpg";
                        elem.title = '图片丢了~~';
                    }
                }, true);
                /* $('img').error(function () {
                     console.log(this);
                     this.src = "/static/index/images/no-img.jpg";
                     this.title = '图片丢了~~';
                 });*/
            }
        },
        api: {
            bindevent: function () {
                common.events.mobileNav();
                common.events.bodyScroll();
                common.events.leftScroll();
                common.events.goTop();
                common.events.navColor();
                common.events.noImage();
            },
        },
    };
    //直接加载
    common.api.bindevent();
    return common;
});