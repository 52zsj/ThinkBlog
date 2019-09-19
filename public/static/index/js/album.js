define(['jquery', 'scrollreveal'], function ($, scrollreveal) {
    var Controller = {
        index: function () {
            window.sr = scrollreveal({reset: true});
            sr.reveal('.picbox', {
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
        api: {
            bindevent: function () {
            }

        },
        events: {}
    };

    return Controller;

});