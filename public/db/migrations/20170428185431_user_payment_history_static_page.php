<?php

use Phinx\Migration\AbstractMigration;

class UserPaymentHistoryStaticPage extends AbstractMigration
{
    /**
     * {@inheritdoc}
     */
    public function up()
    {
        $table = $this->table('static');
        $table->insert([
            'name' => 'user_payment_history',
            'descr' => 'Оплата доступа',
            'template' => '',
            'tpl' => 'user_payment_history',
            'allow_template' => 1,
            'grouplevel' => '1,2,3,4,6',
            'metadescr' => '',
            'metakeys' => '',
            'template_folder' => '',
            'metatitle' => '',
            'date' => time()
        ]);
        $table->saveData();
    }

    /**
     * {@inheritdoc}
     */
    public function down()
    {
        $this->execute( "DELETE FROM dle_static WHERE name = 'user_payment_history'");
    }

}
