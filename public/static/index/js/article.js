define(['jquery', 'layui', 'template', 'treeview'], function ($, layui, template, treeview) {
    var Controller = {
        detail: function () {
            Controller.api.bindevent();
            Controller.events.hover();
            Controller.events.article_like();

        },
        taglist: function () {
            Controller.events.lay_page();

        },
        articlelist: function () {
            var column_id = $('.tag:first').data('value');
            Controller.events.get_article_list(1,column_id);

            $(document).on('click', '.tag', function () {
                var that = $(this);
                if (that.children('i').hasClass('glyphicon-eye-open')) {
                    return false;
                } else {
                    that.children('i').addClass('glyphicon-eye-open').parents('span').siblings().find('i').removeClass('glyphicon-eye-open');
                }
                var column_id = $(this).data('value');
                Controller.events.get_article_list(1, column_id);
            });

        },
        api: {
            bindevent: function () {
                common.events.no_image();
            },
            get_request_url: function () {
                return Config.request_url;
            },
            get_article_like_url: function () {
                return Config.like_url;
            },
            get_article_list_url: function () {
                return Config.article_list_url;
            }
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
                        var str = ' {{each row item i}}\n' +
                            '        {{if item.article_list}}\n' +
                            '        <li>\n' +
                            '            <a href="{{item.detail_url}}">\n' +
                            '                <img src="\\{{item.article_list.cover}}" alt="">\n' +
                            '                <h3>{{item.article_list.title}}</h3>\n' +
                            '            </a>\n' +
                            '        </li>\n' +
                            '        {{/if}}\n' +
                            '    {{/each}}';
                        var htmls = template.render(str, data);
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
                        $("#article-item-list").html(htmls);
                        $(".artile-item .title strong").removeClass('hide');
                        $(".artile-item .title strong b").eq(0).text(data.info);
                        $(".artile-item .title strong b").eq(1).text(data.total);
                        //重新渲染
                        common.events.random_color();
                        common.events.no_image();
                        Controller.events.hover();

                    }, function (data, ret) {
                        layer.msg(ret.msg, {icon: 5}, function () {
                            location.href = ret.jump_url;
                        });

                    });
                    return false;
                });

            },
            hover: function () {
                $(".related-content ul li").hover(function () {
                    $(this).find("h3").show();
                }, function () {
                    $(this).find("h3").hide();
                });
            },
            article_like: function () {
                $("#article-like").click(function () {
                    var that = $(this);
                    var article_id = that.data('value');
                    if (!article_id) {
                        return false;
                    }
                    if (that.hasClass('not-click')) {
                        return false;
                    }
                    var lice_count = that.children('.number').text();
                    lucklyJack.api.ajax({
                        url: Controller.api.get_article_like_url(),
                        data: {article_id: article_id},
                        type: 'POST',
                        dataType: "json",
                        loading: false,
                    }, false, function (data, ret) {
                        layer.msg(ret.msg, {icon: 6});
                        that.children('.number').text((lice_count * 1) + 1);
                        that.removeClass('not-click');
                    }, function (data, ret) {
                        layer.msg(ret.msg, {icon: 5});
                        that.addClass('not-click');
                        return false;
                    })
                })
            },
            get_article_list: function (offset, column_id) {
                console.log(column_id);
                if (!column_id) {
                    return false;
                }
                layui.use('laypage', function () {
                    var laypage = layui.laypage;
                    //严格点
                    offset = offset == '' ? 1 : offset;
                    lucklyJack.api.ajax({
                        url: Controller.api.get_article_list_url(),
                        data: {offset: offset, column_id: column_id},
                        type: "POST",
                        dataType: "json",
                        loading:false,
                    }, false, function (data,ret) {
                        var htmls = template('article-item', data);
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
                                        Controller.events.get_article_list(offset,column_id);
                                    }
                                }
                            });
                        } else {
                            $("#pagelist").empty();
                        }
                        $("#article-item-list").html(htmls);
                        $(".artile-item .title strong").removeClass('hide');
                        $(".artile-item .title strong b").eq(0).text(data.info);
                        $(".artile-item .title strong b").eq(1).text(data.total);
                        //重新渲染
                        common.events.no_image();
                        common.events.random_color();
                        Controller.events.hover();

                    }, function (data, ret) {
                        layer.msg(ret.msg, {icon: 5}, function () {
                            location.href = ret.jump_url;
                        });

                    });
                    return false;
                });

            },


        }

    };
    return Controller;

});