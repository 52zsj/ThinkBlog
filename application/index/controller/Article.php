<?php


namespace app\index\controller;


class Article extends Base
{
    public function initialize() {
        parent::initialize();
    }

    public function detail() {

        return $this->fetch();
    }
}