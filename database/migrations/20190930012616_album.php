<?php

use think\migration\Migrator;
use think\migration\db\Column;

class Album extends Migrator
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
        $table = $this->table('album', ['engine' => 'InnoDB', 'comment' => '相册表']);
        $table->addColumn('title', 'string', array('limit' => 50, 'default' => '', 'null' => false, 'comment' => '相册名称'))
            ->addColumn('description', 'string', array('limit' => 255, 'default' => '', 'null' => false, 'comment' => '相册简介'))
            ->addColumn('cover', 'string', array('limit' => 255, 'default' => '', 'null' => false, 'comment' => '封面图'))
            ->addColumn('status', 'integer', array('limit' => 1, 'default' => 1, 'null' => false, 'comment' => '是否开启'))
            ->addColumn('music', 'integer', array('limit' => 11, 'default' => 0, 'null' => false, 'comment' => '音乐路径'))
            ->addTimestamps('create_time', 'update_time')
            ->create();
    }

    public function down() {
        $this->dropTable('album');
    }
}
