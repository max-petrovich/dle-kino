<?php

if( !defined( 'DATALIFEENGINE' ) OR !defined( 'LOGGED_IN' ) ) {
    die( "Hacking attempt!" );
}

define('EXPORT_USERS_DIR' , 'export/users');

$queryParams = array(
    'date_from' => $fromregdate,
    'date_to' => $toregdate,
    'user_group' => (int)$search_reglevel
);

if (isset($_POST['export_csv']) && $_POST['export_csv'] == 1) {
    if (empty($queryParams['date_from']) || empty($queryParams['date_to']) || $queryParams['user_group'] === 0) {
        echo '<h2>Не выбранные обязательные параметры для экспорта базы пользователей!</h2>';
        return;
    }

    // export
    $db->query("SELECT * FROM " . USERPREFIX . "_users WHERE {$where} ORDER BY {$order_by}");

    if ($db->num_rows()) {
        $fileName = EXPORT_USERS_DIR . '/' . time() . '.csv';
        $filepath = ROOT_DIR . '/uploads/' . $fileName;
        $fp = fopen($filepath, 'w');

        while ($row = $db->get_row()) {
            $xfields = xfieldsdataload($row['xfields']);
            $user = array(
                $row['email'],
                $xfields['first_name'],
                $xfields['last_name'],
                $xfields['country'],
                $xfields['city'],
                $xfields['post_code'],
                $xfields['street'],
                $row['logged_ip'],
                date('d.m.Y', $row['reg_date']),
                $xfields['phone'],
            );

            fputcsv($fp, $user, ';');
        }

        fclose($fp);

        $db->query("INSERT INTO ".PREFIX."_users_exported (filepath, date_from, date_to, users_count, user_group, processed, created_at)
                    VALUES ('".$db->safesql($fileName)."', 
                    '{$queryParams['date_from']}', 
                    '{$queryParams['date_to']}', 
                    '{$db->num_rows()}', 
                    '{$queryParams['user_group']}', 
                    0,
                   NOW())");
    }
}

if (isset($_POST['sub_action']) && $_POST['sub_action'] === 'users_export_process' && isset($_POST['selected_db'])) {
    foreach ($_POST['selected_db'] as $key=>$value) {
        $_POST['selected_db'][$key] = (int)$value;
    }

    if ($_POST['delete']) {
        $dbIds = implode(',',$_POST['selected_db']);
        // delete files
        $db->query("SELECT * FROM ".PREFIX."_users_exported WHERE id IN ({$dbIds})");
        while ($row = $db->get_row()) {
            @unlink(ROOT_DIR . '/uploads/' . EXPORT_USERS_DIR . '/' , $row['filepath']);
        }
        $db->query("DELETE FROM ".PREFIX."_users_exported WHERE id IN ({$dbIds})");
    }
    if ($_POST['checkApprove']) {
        $dbIds = implode(',',$_POST['selected_db']);
        $db->query("UPDATE ".PREFIX."_users_exported SET processed = '1' WHERE id IN ({$dbIds})");
    }
}

/**
 * Show table
 */

echo <<<HTML
<script>
    function checkAllUsersExports() {
        $('#exportUsersTable input[type="checkbox"]').attr('checked', true);
    }
</script>
<form action="" method="post">
<input type="hidden" name="sub_action" value="users_export_process" />
<div class="box">
  <div class="box-header">
    <div class="title">Список экспортированных баз пользователей</div>
  </div>
  <div class="box-content">
    <table class="table table-normal table-hover" id="exportUsersTable">
      <thead>
      <tr>
        <td>Дата генерации</td>
        <td>Дата регистрации (от-до):</td>
        <td style="width: 230px">Количество пользователей:</td>
        <td>Группа:</td>
        <td>Обработано:</td>
        <td style="width: 130px">Действие:</td>
        <td style="width: 40px"><input type="checkbox" onclick="checkAllUsersExports()"></td>
      </tr>
      </thead>
	    <tbody>
HTML;

$db->query("SELECT * FROM ".PREFIX."_users_exported ORDER BY id DESC");

if ($db->num_rows()) {
    while ($row = $db->get_row()) {
        echo '<tr>
                <td align="center">'.date('d/m/Y H:i:s', strtotime($row['created_at'])).'</td>
                <td align="center">'.date('d/m/Y', strtotime($row['date_from'])).' - '.date('d/m/Y', strtotime($row['date_to'])).'</td>
                <td align="center">'.$row['users_count'].'</td>
                <td align="center">'.$user_group[$row['user_group']]['group_name'].'</td>
                <td align="center">'.($row['processed']? 'Да' : 'Нет').'</td>
                <td align="center"><a href="'. $config['http_home_url'].'engine/ajax/downloaduserscsv.php?id='.$row['id'].'" class="btn btn-default">Export to CSV</a></td>
                <td align="center"><input name="selected_db[]" value="'.$row['id'].'" type="checkbox"></td>
            </tr>';
    }
} else {
    echo '<tr><td>Не найдено баз данных пользователей</td></tr>';
}

echo <<<HTML
        </tbody>
	</table>	
   </div>
	<div class="box-footer padded">
		<div class="pull-right">
		    <input class="btn btn-red" type="submit" name="delete" value="Удалить">
		    <input class="btn btn-gold" type="submit" name="checkApprove" value="Отметить как обработанные">
		</div>
	</div>	
</div>
</form>
HTML;
