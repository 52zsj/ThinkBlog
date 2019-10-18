<?php


namespace app\common\library;


class Enum
{
    //字典表数据项目
    const DIDCTIONARY_TITLE = 'title';
    const DIDCTIONARY_WEB_KEYWORDS = 'web_keywords';
    const DIDCTIONARY_WEB_DESCRIPTION = 'web_description';
    //字典表分组项目
    const DIDCTIONARY_WEB = 'web';
    const DIDCTIONARY_FRIENDLY_LINK = 'friendly_link';
    //文件上传路径
    const ALBUM_FILE_UPLOAD_PATH = DIRECTORY_SEPARATOR . 'album' . DIRECTORY_SEPARATOR;
    const ARTICLE_FILE_UPLOAD_PATH = DIRECTORY_SEPARATOR . 'article' . DIRECTORY_SEPARATOR;

}