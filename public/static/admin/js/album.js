define(['xadmin'], function (xadmin) {
    var Controller = {
        index: function () {
            Controller.api.bindevent();

        },
        add: function () {
            layui.use(['form', 'layer', 'upload', 'element'], function () {
                $ = layui.jquery;
                var form = layui.form,
                    layer = layui.layer,
                    upload = layui.upload,
                    url = "/admin/album/fileUpload",
                    element = layui.element;
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
                //背景音乐上传
                var uploadInst = upload.render({
                    elem: '#music-upload'
                    , url: url
                    , multiple: false
                    , number: 1
                    , accept: 'audio'
                    , acceptMime: 'audio/*'
                    , before: function (obj) {
                        //预读本地文件示例，不支持ie8
                        console.log(obj);
                        obj.preview(function (index, file, result) {
                            // $('#cover-upload').attr('src', result); //图片链接（base64）
                            base64_result = result;
                        });

                    }
                    , done: function (res, index, upload) {
                        console.log(res);
                        console.log(index);
                        console.log(upload);
                        var music_text = $('#music-text');
                        if (res.code != '000000') {
                            music_text.css('color', '#FF5722').css('position', 'relative').css('left', '115px').html('上传失败 <button type="button" class="layui-btn layui-btn-sm layui-btn-primary" id="music-reload" >重新上传</button>');
                            music_text.find('#music-reload').on('click', function () {
                                uploadInst.upload();
                            });
                            return false;
                        } else {
                            // 表示上传成功
                            //music_text.css('color', '#FF5722').css('position', 'relative').css('left', '-100px').html('点击可重新上传');
                            var local_url = res.data.localUrl;
                            $("#music").val(local_url);
                            $("#music-upload").html('<i class="layui-icon">&#xe6fc;</i>重选BGM');
                            $('#music-controls').removeClass('layui-hide').attr('src', base64_result);
                            $('#music-text').html('');
                            base64_result = '';
                        }
                        //上传成功
                    }
                    , error: function () {
                        // //演示失败状态，并实现重传
                        var music_text = $('#music-text');
                        music_text.css('color', '#FF5722').css('position', 'relative').css('left', '115px').html('上传失败 <button type="button" class="layui-btn layui-btn-sm layui-btn-primary" id="music-reload" >重新上传</button>');
                        music_text.find('#music-reload').on('click', function () {
                            uploadInst.upload();
                        });
                        return false;
                    }
                });
                //相册上传
                var full_path = [];
                var uploadInst = $('#album-tbale-list'), uploadListIns = upload.render({
                    elem: '#album-list'
                    , url: url
                    , accept: 'image'
                    , multiple: true
                    , acceptMime: 'image/*'
                    , auto: false
                    , bindAction: '#album-list-action'
                    , choose: function (obj) {
                        $("#album-tbale").removeClass('layui-hide');
                        var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
                        //读取本地文件
                        obj.preview(function (index, file, result) {
                            var tr = $(['<tr id="upload-' + index + '">'
                                , '<td><img class="to-big" style="width: 200px" src="' + result + '" alt=""></td>'
                                , '<td>' + (file.size / 1014).toFixed(1) + 'kb</td>'
                                , '<td>等待上传</td>'
                                , '<td>'
                                , '<button type="button" class="layui-btn layui-btn-xs album-reload layui-hide">重传</button>'
                                , '<button type="button" class="layui-btn layui-btn-xs layui-btn-danger album-delete">删除</button>'
                                , '</td>'
                                , '</tr>'].join(''));
                            //单个重传
                            tr.find('.album-reload').on('click', function () {
                                obj.upload(index, file);
                            });

                            //删除
                            tr.find('.album-delete').on('click', function () {
                                delete files[index]; //删除对应的文件
                                tr.remove();
                                uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
                            });

                            uploadInst.append(tr);
                        });
                    }
                    , done: function (res, index, upload) {
                        if (res.code == '000000') { //上传成功
                            var tr = uploadInst.find('tr#upload-' + index)
                                , tds = tr.children();
                            tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
                            tds.eq(3).html(''); //清空操作
                            full_path.push(res.data.localUrl);
                            $("#full-path").val(full_path);
                            return delete this.files[index]; //删除文件队列已经上传成功的文件
                        } else {
                            this.error(index, upload);
                        }

                    }
                    , error: function (index, upload) {
                        var tr = uploadInst.find('tr#upload-' + index)
                            , tds = tr.children();
                        tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
                        tds.eq(3).find('.album-reload').removeClass('layui-hide'); //显示重传
                    }
                });

                //监听提交
                Controller.api.submit(form);


            });

        },
        edit: function () {
            Controller.api.bindevent();
            layui.use(['form', 'layer', 'upload', 'element'], function () {
                $ = layui.jquery;
                var form = layui.form,
                    layer = layui.layer,
                    upload = layui.upload,
                    url = "/admin/album/fileUpload",
                    element = layui.element;
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
                //背景音乐上传
                var uploadInst = upload.render({
                    elem: '#music-upload'
                    , url: url
                    , multiple: false
                    , number: 1
                    , accept: 'audio'
                    , acceptMime: 'audio/*'
                    , before: function (obj) {
                        //预读本地文件示例，不支持ie8
                        console.log(obj);
                        obj.preview(function (index, file, result) {
                            // $('#cover-upload').attr('src', result); //图片链接（base64）
                            base64_result = result;
                        });

                    }
                    , done: function (res, index, upload) {
                        console.log(res);
                        console.log(index);
                        console.log(upload);
                        var music_text = $('#music-text');
                        if (res.code != '000000') {
                            music_text.css('color', '#FF5722').css('position', 'relative').css('left', '115px').html('上传失败 <button type="button" class="layui-btn layui-btn-sm layui-btn-primary" id="music-reload" >重新上传</button>');
                            music_text.find('#music-reload').on('click', function () {
                                uploadInst.upload();
                            });
                            return false;
                        } else {
                            // 表示上传成功
                            //music_text.css('color', '#FF5722').css('position', 'relative').css('left', '-100px').html('点击可重新上传');
                            var local_url = res.data.localUrl;
                            $("#music").val(local_url);
                            $("#music-upload").html('<i class="layui-icon">&#xe6fc;</i>重选BGM');
                            $('#music-controls').removeClass('layui-hide').attr('src', base64_result);
                            $('#music-text').html('');
                            base64_result = '';
                        }
                        //上传成功
                    }
                    , error: function () {
                        // //演示失败状态，并实现重传
                        var music_text = $('#music-text');
                        music_text.css('color', '#FF5722').css('position', 'relative').css('left', '115px').html('上传失败 <button type="button" class="layui-btn layui-btn-sm layui-btn-primary" id="music-reload" >重新上传</button>');
                        music_text.find('#music-reload').on('click', function () {
                            uploadInst.upload();
                        });
                        return false;
                    }
                });
                //相册上传
                var full_path = [];
                var uploadInst = $('#album-tbale-list'), uploadListIns = upload.render({
                    elem: '#album-list'
                    , url: url
                    , accept: 'image'
                    , multiple: true
                    , acceptMime: 'image/*'
                    , auto: false
                    , bindAction: '#album-list-action'
                    , choose: function (obj) {
                        $("#album-tbale").removeClass('layui-hide');
                        var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
                        //读取本地文件
                        obj.preview(function (index, file, result) {
                            var tr = $(['<tr id="upload-' + index + '">'
                                , '<td><img class="to-big" style="width: 200px" src="' + result + '" alt=""></td>'
                                , '<td>' + (file.size / 1014).toFixed(1) + 'kb</td>'
                                , '<td>等待上传</td>'
                                , '<td>'
                                , '<button type="button" class="layui-btn layui-btn-xs album-reload layui-hide">重传</button>'
                                , '<button type="button" class="layui-btn layui-btn-xs layui-btn-danger album-delete">删除</button>'
                                , '</td>'
                                , '</tr>'].join(''));
                            //单个重传
                            tr.find('.album-reload').on('click', function () {
                                obj.upload(index, file);
                            });

                            //删除
                            tr.find('.album-delete').on('click', function () {
                                delete files[index]; //删除对应的文件
                                tr.remove();
                                uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
                            });

                            uploadInst.append(tr);
                        });
                    }
                    , done: function (res, index, upload) {
                        if (res.code == '000000') { //上传成功
                            var tr = uploadInst.find('tr#upload-' + index)
                                , tds = tr.children();
                            tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
                            tds.eq(3).html(''); //清空操作
                            full_path.push(res.data.localUrl);
                            $("#full-path").val(full_path);
                            return delete this.files[index]; //删除文件队列已经上传成功的文件
                        } else {
                            this.error(index, upload);
                        }

                    }
                    , error: function (index, upload) {
                        var tr = uploadInst.find('tr#upload-' + index)
                            , tds = tr.children();
                        tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
                        tds.eq(3).find('.album-reload').removeClass('layui-hide'); //显示重传
                    }
                });
                //监听提交
                Controller.api.submit(form);

            });


        },
        detail:function(){
            layui.use(['form', 'layer', 'upload', 'element'], function () {
                $ = layui.jquery;
                var form = layui.form,
                    layer = layui.layer,
                    upload = layui.upload,
                    url = "/admin/album/fileUpload";
                var base64_result;
                //相册上传
                var full_path = [];
                var uploadInst = $('#album-tbale-list'), uploadListIns = upload.render({
                    elem: '#album-list'
                    , url: url
                    , accept: 'image'
                    , multiple: true
                    , acceptMime: 'image/*'
                    , auto: false
                    , bindAction: '#album-list-action'
                    , choose: function (obj) {
                        $("#album-tbale").removeClass('layui-hide');
                        var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
                        //读取本地文件
                        obj.preview(function (index, file, result) {
                            var tr = $(['<tr id="upload-' + index + '">'
                                , '<td><img class="to-big" style="width: 200px" src="' + result + '" alt=""></td>'
                                , '<td>' + (file.size / 1014).toFixed(1) + 'kb</td>'
                                , '<td>等待上传</td>'
                                , '<td>'
                                , '<button type="button" class="layui-btn layui-btn-xs album-reload layui-hide">重传</button>'
                                , '<button type="button" class="layui-btn layui-btn-xs layui-btn-danger album-delete">删除</button>'
                                , '</td>'
                                , '</tr>'].join(''));
                            //单个重传
                            tr.find('.album-reload').on('click', function () {
                                obj.upload(index, file);
                            });

                            //删除
                            tr.find('.album-delete').on('click', function () {
                                delete files[index]; //删除对应的文件
                                tr.remove();
                                uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
                            });

                            uploadInst.append(tr);
                        });
                    }
                    , done: function (res, index, upload) {
                        if (res.code == '000000') { //上传成功
                            var tr = uploadInst.find('tr#upload-' + index)
                                , tds = tr.children();
                            tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
                            tds.eq(3).html(''); //清空操作
                            full_path.push(res.data.localUrl);
                            $("#full-path").val(full_path);
                            return delete this.files[index]; //删除文件队列已经上传成功的文件
                        } else {
                            this.error(index, upload);
                        }

                    }
                    , error: function (index, upload) {
                        var tr = uploadInst.find('tr#upload-' + index)
                            , tds = tr.children();
                        tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
                        tds.eq(3).find('.album-reload').removeClass('layui-hide'); //显示重传
                    }
                });
                //全选
                form.on('checkbox(checkall)', function (data) {
                    // console.log(data.elem); //得到checkbox原始DOM对象
                    // console.log(data.elem.checked); //是否被选中，true或者false
                    // console.log(data.value); //复选框value值，也可以通过data.elem.value得到
                    // console.log(data.othis); //得到美化后的DOM对象
                    var checked = data.elem.checked;
                    if (checked) {
                        $(".item-checkbox").prop("checked", true);
                        $("#del-all").removeClass('layui-btn-disabled');
                    } else {
                        $(".item-checkbox").prop("checked", false);
                        $("#del-all").addClass('layui-btn-disabled');
                    }
                    form.render();
                });
                //图片放大
                $(document).on('click', '.to-big', function () {
                    var url = $(this).attr('src');
                    var img_html = "<img id='big-img' style='width: 100%;height: 100%' src='" + url + "'/>";
                    layer.open(
                        {
                            type: 1,
                            title: false,
                            content: img_html,
                            closeBtn: 2,
                            anim: 2,
                            resize: true,
                            area: ['50%', '60%'],
                        }
                    )
                });
                //单个删除
                $(document).on('click', '.del', function () {
                    var checkbox_id = $(this).data('checkbox-id');
                    var id = $(this).data('id');
                    if (id == '') {
                        id = $("#" + checkbox_id).val();
                    }
                    var obj = $("#img-box-" + id);
                    console.log(obj);
                    layer.confirm('确定删除选中项吗？', function () {
                        Controller.events.delItem(id, obj);
                    });
                });
                //批量删除
                $("#del-all").click(function () {
                    //获取被选中的checkbox
                    layer.confirm('确定删除选中项吗？', function () {
                        $(".item-checkbox:checked").each(function (k, v) {
                            var obj = $(v);
                            var id = obj.val();
                            var div_obj = $("#img-box-" + id);
                            Controller.events.delItem(id, div_obj);
                        });
                    })

                });
                //多个选中 按钮禁用取消
                form.on('checkbox(itemcheckbox)', function (data) {
                    //判断选中数量是否大于0 大于0 则按钮开放
                    var length = $(".item-checkbox:checked").length;
                    if (length > 0) {
                        $("#del-all").removeClass('layui-btn-disabled');
                    } else {
                        $("#del-all").addClass('layui-btn-disabled');
                    }
                    form.render();
                });
                //删除函数
                //滚动放大 缩小
                /*$(document).on("mousewheel DOMMouseScroll", "#big-img", function (e) {
                    //"#big-img",
                    var parent_width = $(this).parents('.layui-layer-content').width();
                    var parent_height = $(this).parents('.layui-layer-content').height();
                    var type = e.originalEvent.deltaY;
                    var data =parseInt(type);
                    if (data > 0) {
                        $(this).parents('.layui-layer-content').width(parent_width -60);
                        $(this).parents('.layui-layer-content').height(parent_height - 60);
                    }
                    //向上滚动
                    if (data < 0) {
                        $(this).parents('.layui-layer-content').width(parent_width + 60);
                        $(this).parents('.layui-layer-content').height(parent_height + 60);
                    }
                });

                function MouseWheelHandler(e, obj) {
                    var e = window.event || e; // old IE support
                    var delta = Math.max(-1, Math.min(1, (e.wheelDelta || -e.detail)));
                    obj.width(Math.max(50, Math.min(1800, obj.width() + (30 * delta))) + "px");
                    return false;
                }*/

            });
        },

        api: {
            bindevent: function () {
                Controller.events.to_big();
            },
            submit: function (form) {
                form.on('submit(submit)', function (data) {
                    console.log(data);
                    var datas = data.field;
                    lucklyJack.api.ajax({
                        type: 'POST',
                        data: datas,
                        dataType: 'JSON'
                    }, false, function (data, res) {
                        layer.alert(res.msg, {icon: 6}, function () {
                            //关闭当前frame
                            xadmin.close();
                            // 可以对父窗口进行刷新
                            xadmin.father_reload();
                        });

                    }, function (data, res) {
                        layer.msg(res.msg, {shift: -1, time: 2000, icon: 5}, function () {
                        });
                    });
                    return false;
                });
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
            },
            delItem: function (id, obj) {
                lucklyJack.api.ajax({
                    url: "/admin/album/delItem",
                    type: "POST",
                    data: {id: id},
                }, false, function (data, res) {
                    layer.msg(res.msg);
                    obj.remove();
                }, function (data, res) {
                    layer.msg(res.msg);
                    return false;
                });
            }
        }

    };
    return Controller;

});