<?php


namespace app\common\model;


class Admin extends Base
{
    protected $name='admin';
    protected $autoWriteTimestamp = 'datetime';
    protected $createTime='create_time';
    protected $updateTime='update_time';

}