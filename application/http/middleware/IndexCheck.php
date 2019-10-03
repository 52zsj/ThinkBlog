<?php

namespace app\http\middleware;

class IndexCheck
{
    public function handle($request, \Closure $next)
    {
        dump($request);exit();
        return $next($request);
    }
}
