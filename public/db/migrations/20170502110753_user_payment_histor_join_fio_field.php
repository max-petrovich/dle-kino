<?php

use Phinx\Migration\AbstractMigration;

class UserPaymentHistorJoinFioField extends AbstractMigration
{
    public function up()
    {
        $table = $this->table('user_payment_history');
        $table->renameColumn('first_name', 'user_name');
        $table->removeColumn('surname')
            ->save();
    }

    public function down()
    {
        $table = $this->table('user_payment_history');
        $table->renameColumn('user_name', 'first_name');
        $table->addColumn('surname', 'string')
            ->save();
    }
}
