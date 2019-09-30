<?php

use think\migration\Migrator;
use think\migration\db\Column;

class Colum extends Migrator
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

        $table = $this->table('column', ['engine' => 'InnoDB', 'comment' => '文章分类表']);
        $table->addColumn('name', 'string', ['limit' => 50, 'null' => false, 'default' => '', 'comment' => '栏目名称'])
            ->addColumn('pid', 'integer', ['limit' => 11, 'null' => false, 'default' => 0, 'comment' => '上级分类 0顶级'])
            ->addColumn('status', 'integer', ['limit' => 1, 'null' => false, 'default' => 1, 'comment' => '是否显示 1是 0 否'])
            ->addColumn('order_key', 'integer', ['limit' => 6, 'null' => false, 'default' => 1, 'comment' => '排序'])
            ->addTimestamps('create_time', 'update_time')
            ->create();
    }

    public function down() {
        $this->dropTable('column');
    }
}
