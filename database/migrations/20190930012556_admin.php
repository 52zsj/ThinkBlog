<?php

use think\migration\Migrator;
use think\migration\db\Column;

class Admin extends Migrator
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

        $table = $this->table('admin', ['engine' => 'InnoDB']);
        $table->addColumn('user_name', 'string', array('limit' => 20, 'default' => '', 'null' => false, 'comment' => '用户名'))
            ->addColumn('password', 'string', array('limit' => 32, 'default' => '', 'null' => false, 'comment' => '用户密码'))
            ->addColumn('salt', 'string', array('limit' => 4, 'default' => '', 'null' => false, 'comment' => '密码盐'))
            ->addColumn('nick_name', 'string', array('limit' => 20, 'default' => '', 'null' => false, 'comment' => '昵称'))
            ->addColumn('join_ip', 'integer', array('limit' => 11, 'default' => 0, 'null' => false, 'comment' => '加入IP'))
            ->addColumn('avatar', 'string', array('default' => '', 'null' => false, 'comment' => '头像地址 存储云端'))
            ->addColumn('status', 'integer', array('default' => 1, 'null' => false, 'comment' => '头像地址 存储云端'))
            ->addTimestamps('create_time', 'update_time')
            ->create();
        /*密码123456*/
        $data = [
            'id' => '1',
            'user_name' => 'admin',
            'password' => '83c69fb8d19137202c9f88735b781d4d',
            'salt' => 'abcd',
            'nick_name' => 'admin',
            'join_ip' => '0',
            'avatar' => '',
            'create_time' => '2019-09-25 15:30:35',
            'update_time' => '2019-09-25 15:30:35',
            'status' => '1',
        ];
        $table->insert($data)->save();
    }

    public function down() {
        $this->dropTable('admin');
    }
}
