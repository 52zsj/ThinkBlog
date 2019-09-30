<?php

use think\migration\Migrator;
use think\migration\db\Column;

class Group extends Migrator
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
        $table = $this->table('group', ['engine' => 'InnoDB', 'comment' => '分组表']);
        $table->addColumn('name', 'string', array('limit' => 25, 'default' => '', 'null' => false, 'comment' => '显示名称'))
            ->addColumn('pid', 'integer', array('limit' => 11, 'default' => 0, 'null' => false, 'comment' => '父id'))
            ->addColumn('rules', 'text', array('null' => false, 'comment' => '规则'))
            ->addColumn('status', 'integer', array('limit' => 1, 'default' => 1, 'null' => false, 'comment' => '是否启用1启用0禁用'))
            ->addTimestamps('create_time', 'update_time')
            ->create();
    }

    public function down() {
        $this->dropTable('group');
    }
}
