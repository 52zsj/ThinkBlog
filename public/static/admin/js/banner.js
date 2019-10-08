define(['xadmin', 'form', 'jack.table'], function (xadmin, Form, Table) {
    var Controller = {
            index: function () {
                var option = {
                    url_list: {
                        index_url: 'banner/index',
                        add_url: 'banner/add',
                        edit_url: 'banner/edit',
                        del_url: 'banner/del',
                    },
                    elem: '#table',
                    url: 'banner/index',//数据接口
                    title: '轮播图',
                    toolbar: '#tool-bar',
                    cols: [[ //表头
                        {type: 'checkbox', width: '5%'},
                        {field: 'id', title: 'ID'},
                        {field: 'title', title: '标题', edit: 'text'},
                        {field: 'cover', title: '缩略图', templet: '#image'},
                        {field: 'link', title: '外链', edit: 'text'},
                        {field: 'description', title: '简介', edit: 'text'},
                        {field: 'content', title: '内容'},
                        {field: 'status', title: '状态', templet: '#status'},
                        {field: 'create_time', title: '创建时间'},
                        {field: 'right', title: '操作', toolbar: '#operate', fixed: 'right'},
                    ]]
                };
                Table.api.bindevent(option);
                Controller.api.bindevent();
            },
            add: function () {
                layui.use(['upload'], function () {
                    var upload = layui.upload,
                        url = "/admin/banner/fileUpload";
                    var base64_result;
                    //封面上传
                    var uploadInst = upload.render({
                        elem: '#cover-upload'
                        , url: url
                        , multiple: false
                        , number: 1
                        , accept: 'images'
                        , acceptMime: 'image/*'
                        , before: function (obj) {
                            //预读本地文件示例，不支持ie8
                            console.log(obj);
                            obj.preview(function (index, file, result) {
                                // $('#cover-upload').attr('src', result); //图片链接（base64）
                                base64_result = result;
                            });

                        }
                        , done: function (res, index, upload) {
                            var cover_text = $('#cover-text');
                            if (res.code != '000000') {
                                cover_text.css('color', '#FF5722').css('position', 'relative').css('left', '-100px').prop('id', 'cover-reload').html('上传失败');
                                cover_text.find('#cover-reload').on('click', function () {
                                    uploadInst.upload();
                                });
                                return false;
                            } else {
                                // 表示上传成功
                                cover_text.css('color', '#FF5722').css('position', 'relative').css('left', '-100px').html('点击可重新上传');
                                var local_url = res.data.localUrl;
                                $("#cover").val(local_url);
                                $('#cover-upload').attr('src', base64_result);
                                base64_result = '';
                            }
                            //上传成功
                        }
                        , error: function () {
                            //演示失败状态，并实现重传
                            // var demo_text = $('#cover-text');
                            // demo_text.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                            // demo_text.find('.demo-reload').on('click', function () {
                            //     uploadInst.upload();
                            // });
                        }
                    });
                });
                Controller.api.bindevent();


            },
            edit: function () {
                layui.use(['upload'], function () {
                    var upload = layui.upload,
                        url = "/admin/article/fileUpload";
                    var base64_result;
                    //封面上传
                    var uploadInst = upload.render({
                        elem: '#cover-upload'
                        , url: url
                        , multiple: false
                        , number: 1
                        , accept: 'images'
                        , acceptMime: 'image/*'
                        , before: function (obj) {
                            //预读本地文件示例，不支持ie8
                            console.log(obj);
                            obj.preview(function (index, file, result) {
                                // $('#cover-upload').attr('src', result); //图片链接（base64）
                                base64_result = result;
                            });

                        }
                        , done: function (res, index, upload) {
                            var cover_text = $('#cover-text');
                            if (res.code != '000000') {
                                cover_text.css('color', '#FF5722').css('position', 'relative').css('left', '-100px').prop('id', 'cover-reload').html('上传失败');
                                cover_text.find('#cover-reload').on('click', function () {
                                    uploadInst.upload();
                                });
                                return false;
                            } else {
                                // 表示上传成功
                                cover_text.css('color', '#FF5722').css('position', 'relative').css('left', '-100px').html('点击可重新上传');
                                var local_url = res.data.localUrl;
                                $("#cover").val(local_url);
                                $('#cover-upload').attr('src', base64_result);
                                base64_result = '';
                            }
                            //上传成功
                        }
                        , error: function () {
                            //演示失败状态，并实现重传
                            // var demo_text = $('#cover-text');
                            // demo_text.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                            // demo_text.find('.demo-reload').on('click', function () {
                            //     uploadInst.upload();
                            // });
                        }
                    });
                });
                Controller.api.bindevent();
            },
            api: {
                bindevent: function () {
                    Form.api.bindevent();
                },
            },
            events: {}

        }
    ;
    return Controller;

});