<?php
return
    [
        //验证码字符集合
        'codeSet' => '2345689',
        //验证码过期时间（s）
        'expire' => 1800,
        //使用中文验证码
        'useZh' => false,
        //中文验证码字符串
        'zhSet' => '',
        //使用背景图片
        'useImgBg' => false,
        //验证码字体大小(px)
        'fontSize' => 25,
        //是否画混淆曲线
        'useCurve' => true,
        //是否添加杂点
        'useNoise' => true,
        //验证码图片高度，设置为0为自动计算
        'imageH' => 0,
        //验证码图片宽度，设置为0为自动计算
        'imageW' => 0,
        //验证码位数
        'length' => 4,
        //验证码字体，不设置是随机获取
        'fontttf' => '',
        //背景颜色
        'bg' => [243, 251, 254],
        //验证成功后是否重置
        'reset' => true
    ];