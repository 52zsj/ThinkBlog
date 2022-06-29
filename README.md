![](https://box.kancloud.cn/5a0aaa69a5ff42657b5c4715f3d49221) 

ThinkPHP 5.1（LTS版本） —— 创建的博客网站
===============

ThinkPHP5.1对底层架构做了进一步的改进，减少依赖，其主要特性包括：

 + 采用容器统一管理对象
 + 支持Facade
 + 注解路由支持
 + 路由跨域请求支持
 + 配置和路由目录独立
 + 取消系统常量
 + 助手函数增强
 + 类库别名机制
 + 增加条件查询
 + 改进查询机制
 + 配置采用二级
 + 依赖注入完善
 + 支持`PSR-3`日志规范
 + 中间件支持（V5.1.6+）
 + Swoole/Workerman支持（V5.1.18+）


> ThinkPHP5的运行环境要求PHP5.6以上。

## 更新

使用composer更新

~~~
composer update
~~~

nginx配置

~~~
server {
        listen 80;
        server_name your_domain.com;
        root your_path/myBlog/public;
        index index.html index.php default.php;
        # rewrite ^ index.php$uri last;
        location / { 
        if (!-e $request_filename) {
                rewrite  ^(.*)$  /index.php?s=/$1  last;
            }
        }
}

~~~

然后就可以在浏览器中访问

~~~
http://your_domain.com
~~~


## 在线手册

+ [完全开发手册](https://www.kancloud.cn/manual/thinkphp5_1/content)
+ [升级指导](https://www.kancloud.cn/manual/thinkphp5_1/354155) 



## 版权信息

ThinkPHP遵循Apache2开源协议发布，并提供免费使用。
