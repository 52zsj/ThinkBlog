<?php

use think\migration\Migrator;
use think\migration\db\Column;

class Tag extends Migrator
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
        $table = $this->table('tag', ['engine' => 'InnoDB', 'comment' => '分组表']);
        $table->addColumn('name', 'string', array('limit' => 15, 'default' => '', 'null' => false, 'comment' => '名称'))
            ->addColumn('status', 'integer', array('limit' => 1, 'default' => 1, 'null' => false, 'comment' => '是否启用1启用0禁用'))
            ->addColumn('order_key', 'integer', array('limit' => 6, 'default' => 50, 'null' => false, 'comment' => '排序'))
            ->addTimestamps('create_time')
            ->create();
    }

    public function down() {
        $this->dropTable('tag');
    }
}
