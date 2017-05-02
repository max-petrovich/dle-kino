<?php

use Phinx\Migration\AbstractMigration;

class UserPaymentHistoryAdmin extends AbstractMigration
{
    /**
     * {@inheritdoc}
     */
    public function up()
    {
        $table = $this->table('admin_sections');
        $table->insert([
            'name' => 'user_payment_history',
            'title' => 'Оплата доступа',
            'descr' => '',
            'icon' => 'user_payment_history.png',
            'allow_groups' => 1,
        ]);
        $table->saveData();
    }

    /**
     * {@inheritdoc}
     */
    public function down()
    {
        $this->execute( "DELETE FROM dle_admin_sections WHERE name = 'user_payment_history'");
    }
}
