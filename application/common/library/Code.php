<?php

namespace app\common\library;


class Code
{
    // http 请求成功
    const HTTP_REQUEST_SUCCESS_CODE = 200;
    // http 请求失败
    const HTTP_REQUEST_ERROR_CODE = 400;
    // 数据请求成功
    const REQUEST_SUCCESS = '000000';
    //
    const REQUEST_SUCCESS_HTML = '000001';
    // 数据请求失败
    const REQUEST_ERROR = '100000';
    // 参数校验错误
    const PARAM_INVALIDATE = '100001';
    // 数据不存在
    const OBJECT_NOT_FOUND = '100002';
    // 请求方式错误
    const REQUEST_METHOD_INVALIDATE = '100003';
    // 授权失败
    const AUTH_FAILURE = '100004';
    // 无权限
    const AUTH_ACCESS_DENIED = '100005';
    // 未找到操作方法
    const ACTION_NOT_FOUND = '100006';
    // 用户已登录
    const USER_HAD_LOGIN = '100007';
    // 操作失败
    const OPERATE_FAILURE = '100008';
    // 授权过期
    const AUTH_EXPIRE = '100009';
    // 授权过期
    const LOGIN_TIME_INVALIDATE = '100010';
    // 授权过期
    const SIGN_IN_FAILURE = '100011';
    // 账号已存在
    const ACCOUNT_HAS_EXISTS = '100012';
    // token 过期
    const TOKEN_EXPIRED = '100013';
    // 未知异常
    const UNKNOWN_EXCEPTION = '999999';
}