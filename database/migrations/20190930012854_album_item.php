<?php

use think\migration\Migrator;
use think\migration\db\Column;

class AlbumItem extends Migrator
{
    /**
     * Change Method.
     *
     * Write your reversible migrations using this method.
     *
     * More information on writing migrations is available here:
     * http://docs.phinx.org/en/latest/migrations.html#the-abstractmigration-class
     *
     * The following commands can be used in this method and Phinx will
     * automatically reverse them when rolling back:
     *
     *    createTable
     *    renameTable
     *    addColumn
     *    renameColumn
     *    addIndex
     *    addForeignKey
     *
     * Remember to call "create()" or "update()" and NOT "save()" when working
     * with the Table class.
     */
    public function up() {
        $table = $this->table('album_item', ['engine' => 'InnoDB', 'comment' => '相册图片表']);
        $table->addColumn('album_id', 'integer', array('limit' => 11, 'comment' => '相册ID'))
            ->addColumn('thumb_path', 'string', array('limit' => 255, 'default' => '', 'null' => false, 'comment' => '缩略图路径'))
            ->addColumn('full_path', 'string', array('limit' => 255, 'default' => '', 'null' => false, 'comment' => '原始图路径'))
            ->addColumn('name', 'string', array('limit' => 50, 'default' => '', 'null' => false, 'comment' => '文件名'))
            ->create();
    }

    public function down() {
        $this->dropTable('album_item');
    }

}
