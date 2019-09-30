<?php

use think\migration\Migrator;
use think\migration\db\Column;

class Menu extends Migrator
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

        $table = $this->table('menu', ['engine' => 'InnoDB', 'comment' => '分组表']);
        $table->addColumn('title', 'string', array('limit' => 30, 'default' => '', 'null' => false, 'comment' => '名称'))
            ->addColumn('pid', 'integer', array('limit' => 11, 'default' => 0, 'null' => false, 'comment' => '父id'))
            ->addColumn('url', 'string', array('limit' => 100, 'default' => '', 'null' => false, 'comment' => 'url节点路径'))
            ->addColumn('icon', 'string', array('limit' => 20, 'default' => '', 'null' => false, 'comment' => '图标'))
            ->addColumn('remark', 'string', array('limit' => 255, 'default' => '', 'null' => false, 'comment' => '备注'))
            ->addColumn('is_menu', 'integer', array('limit' => 1, 'default' => 0, 'null' => false, 'comment' => '备注'))
            ->addColumn('order_key', 'integer', array('limit' => 6, 'default' => 50, 'null' => false, 'comment' => '备注'))
            ->addColumn('status', 'integer', array('limit' => 1, 'default' => 1, 'null' => false, 'comment' => '是否启用1启用0禁用'))
            ->addTimestamps('create_time', 'update_time')
            ->create();
    }

    public function down() {
        $this->dropTable('menu');
    }
}
