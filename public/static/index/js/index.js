define(['jquery', 'layui', 'template'], function ($, layui, template) {
    var Controller = {
        index: function () {
            var article_total = Controller.api.get_article_total();

            Controller.events.lay_page(article_total);
        },
        api: {
            bindevent: function () {
            },
            get_article_total: function () {
                return Config.article_total;
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
                            , limit: 14
                            , theme: '#1E9FFF'
                            , curr: location.hash.replace('#!page=', '') //获取hash值为page的当前页
                            , hash: 'page' //自定义hash值
                            , jump: function (obj) {
                                var offset = obj.curr;//当前页
                                lucklyJack.api.ajax({
                                    url: 'index.html',
                                    type: "POST",
                                    data: {offset: offset},
                                    loading: false,
                                }, false, function (res) {
                                    var htmls = template('article-item', res);
                                    console.log(htmls);
                                    $("#article-item-list").html(htmls);
                                });
                            }

                        });
                    });
                } else {
                    var htmls = '<div style=" text-align: center;color: red;line-height: 350px;font-size: 25px;">暂无文章内容</div>';
                    $("#picbox").html(htmls);
                }
            },
        }
    };
    return Controller;

});