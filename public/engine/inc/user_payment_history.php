<?PHP

use Symfony\Component\HttpFoundation\Request;
use Kilte\Pagination\Pagination;

if( !defined( 'DATALIFEENGINE' ) OR !defined( 'LOGGED_IN' ) ) {
    die( "Hacking attempt!" );
}

if( $member_id['user_group'] != 1 ) {
    msg( "error", $lang['index_denied'], $lang['index_denied'] );
}

function showUserPaymentHistoryRow($row) {
    global $config, $user_group;
    return '<tr>
<td width="2%"><a href="'.$config['http_home_url'].'uploads/files/user-payment-history/'.$row['filepath'].'" target="_blank"><i class="icon icon-file"></i></a></td>
<td width="5%"><a href="">'.$row['user_id'].'</a></td>
<td>'.$row['email'].'</td>
<td>'.$row['user_name'].'</td>
<td>'.$user_group[$row['user_group']]['group_name'].'</td>
<td>'.date('Y-m-d H:i:s', $row['reg_date']).'</td>
<td>'.$row['created_at'].'</td>
<td><div class="btn-group">
          <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">Действие <span class="caret"></span></button>
          <ul class="dropdown-menu text-left pull-right">
                <li><a onclick="javascript:popupedit(\''.$row['user_id'].'\'); return(false);" href="#"><i class="icon-pencil"></i> Edit user</a></li>
                <li><a onclick="javascript:delete_record(\''.$row['id'].'\'); return(false);" href="#"><i class="icon-trash"></i> Delete record</a></li>
          </ul>
        </div></td>
</tr>';
}

require ROOT_DIR . '/vendor/autoload.php';
$request = Request::createFromGlobals();

echoheader( "<i class=\"icon-credit-card\"></i> User Payment History",
    '<a href="'.$config['http_home_url']. $config['admin_path'] . '?mod=user_payment_history" class="btn btn-blue">Short info</a> <a href="'.$config['http_home_url']. $config['admin_path'] . '?mod=user_payment_history&action=full" class="btn btn-green">All payments</a>' );

echo <<<HTML
<script>
function popupedit( id ){

		var rndval = new Date().getTime(); 

		$('body').append('<div id="modal-overlay" style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: #666666; opacity: .40;filter:Alpha(Opacity=40); z-index: 999; display:none;"></div>');
		$('#modal-overlay').css({'filter' : 'alpha(opacity=40)'}).fadeIn('slow');
	
		$("#dleuserpopup").remove();
		$("body").append("<div id='dleuserpopup' title='Редактирование пользователя' style='display:none'></div>");
	
		$('#dleuserpopup').dialog({
			autoOpen: true,
			width: 570,
			height: 510,
			resizable: false,
			dialogClass: "modalfixed",
			buttons: {
				"Отмена": function() { 
					$(this).dialog("close");
					$("#dleuserpopup").remove();							
				},
				"Сохранить": function() {
					document.getElementById('edituserframe').contentWindow.document.getElementById('saveuserform').submit();
				}
			},
			open: function(event, ui) { 
				$("#dleuserpopup").html("<iframe name='edituserframe' id='edituserframe' width='100%' height='389' src='/admin.php?mod=editusers&action=edituser&id=" + id + "&rndval=" + rndval + "' frameborder='0' marginwidth='0' marginheight='0' allowtransparency='true'></iframe>");
			},
			beforeClose: function(event, ui) { 
				$("#dleuserpopup").html("");
			},
			close: function(event, ui) {
					$('#modal-overlay').fadeOut('slow', function() {
			        $('#modal-overlay').remove();
			    });
			 }
		});

		if ($(window).width() > 830 && $(window).height() > 530 ) {
			$('.modalfixed.ui-dialog').css({position:"fixed"});
			$('#dleuserpopup').dialog( "option", "position", ['0','0'] );
		}

		return false;

}

function delete_record(id) {
    var form = $('<form />').attr({action: '', method: 'post'});
    form.append('<input type="hidden" name="subaction" value="delete_record" />');
    form.append('<input type="hidden" name="id" value="'+id+'" />');
    $('body').append(form);
    form.submit();
}
</script>
HTML;

$action = 'short';
$subaction = $request->get('subaction');

if ($subaction == 'delete_record') {
    $record_id = $request->get('id');
    if ($record_id <= 0) die('error');

    $row = $db->super_query("SELECT * FROM ".PREFIX."_user_payment_history WHERE id = '".(int)$record_id."'");
    if (!$row) {
        header("Refresh:0");
        die();
    }
    @unlink(ROOT_DIR . '/uploads/files/user-payment-history/' . $row['filepath']);
    $db->query("DELETE FROM ".PREFIX."_user_payment_history WHERE id = '".$row['id']."' ");

    echo '<div class="alert alert-success">Record deleted!</div>';
}


if ($request->get('action') === 'full') {
    $action = 'full';
}

if ($action === 'short') {
    /**
     * Show short info about payments
     */
    $db->query("SELECT SQL_CALC_FOUND_ROWS uph.*, u.email, u.reg_date, u.user_group
                FROM ".PREFIX."_user_payment_history uph
                LEFT JOIN ".USERPREFIX."_users u ON u.user_id = uph.user_id
                WHERE created_at >= DATE_ADD(CURDATE(), INTERVAL -7 DAY) ORDER BY created_at DESC");

    if ($db->num_rows()) {
        $items = [];

        while ($row = $db->get_row()) {
            $rowDate = date('Y-m-d', strtotime($row['created_at']));
            if (date('Y-m-d') === $rowDate) {
                $items['today'][] = $row;
            } elseif (date('Y-m-d', strtotime('-1 day'))) {
                $items['yesterday'][] = $row;
            }
            $items['7days'][] = $row;
        }

        // all
        $countAll = $db->super_query("SELECT FOUND_ROWS() as 'all' ");

        $timelines = [
            'today' => 'Сегодня',
            'yesterday' => 'Вчера',
            '7days' => 'Последние 7 дней'
        ];

        echo '<table class="table table-normal">
            <thead><tr><th>Today</th><th>Yesterday</th><th>Last 7 days</th><th>All</th></tr></thead>
            <tbody><tr><td>'.count($items['today']).'</td><td>'.count($items['yesterday']).'</td><td>'.count($items['7days']).'</td><td>'.$countAll['all'].'</td></tr></tbody>
            </table><br/>';

        foreach ($timelines as $timelineKey=>$timelineTitle) {
            echo '<div class="box">
  <div class="box-header">
    <div class="title">Payments за '.$timelineTitle.'</div>
  </div>
  <div class="box-content"><table class="table table-normal" >
  <thead>
  <tr>
  <th>File</th>
  <th>User ID</th>
  <th>User email</th>
  <th>User name</th>
  <th>User group</th>
  <th>User registred</th>
  <th>Created at</th>
  <th></th>
</tr>
</thead>
    <tbody>';
            if (isset($items[$timelineKey])) {
                foreach ($items[$timelineKey] as $row) {
                    echo showUserPaymentHistoryRow($row);
                }
            } else {
                echo '<tr><td><div align="center"><br><br>Нет платежей<br><br><br></div></td></tr>';
            }
            echo '</tbody></table>
   </div>
</div>';
        }
    } else {
        // нет платежей за последние 7 дней
    }

} elseif ($action === 'full') {
    $itemsPerPage = 10;
    $current_page = $request->get('page', 1);
    /**
     * Show paginated info about payments
     */
    // Count
    $allItemsCount = $db->super_query("SELECT COUNT(id) as count FROM ".PREFIX."_user_payment_history");

    $pagination = new Pagination($allItemsCount['count'], $current_page, $itemsPerPage, 4);
    $offset = $pagination->offset();
    $limit = $pagination->limit();
    $pages = $pagination->build(); // Contains associative array with a numbers of a pages

    $db->query("SELECT SQL_CALC_FOUND_ROWS uph.*, u.email, u.reg_date, u.user_group
                FROM ".PREFIX."_user_payment_history uph
                LEFT JOIN ".USERPREFIX."_users u ON u.user_id = uph.user_id
                ORDER BY created_at DESC
                LIMIT $offset, $limit");

    if ($db->num_rows()) {
        echo '<div class="box">
  <div class="box-header">
    <div class="title">All payments</div>
  </div>
  <div class="box-content"><table class="table table-normal" >
  <thead>
  <tr>
  <th>File</th>
  <th>User ID</th>
  <th>User email</th>
  <th>User name</th>
  <th>User group</th>
  <th>User registred</th>
  <th>Created at</th>
  <th></th>
</tr>
</thead>
    <tbody>';
        while ($row = $db->get_row()) {
            echo showUserPaymentHistoryRow($row);
        }
        echo '</tbody></table>
<div style="text-align: center">
    <ul class="pagination pagination-sm">
    ';
        foreach ($pages as $pageNum=>$pageData) {
            if ($pageData == 'current') {
                echo '<li class="active"><a>'.$pageNum.'</a></li>';
            } elseif ($pageData == 'more' || $pageData == 'less') {
                echo '<li class="disabled"><a>...</a></li>';
            } else {
                echo '<li><a href="'.$config['http_home_url']. $config['admin_path'] . '?mod=user_payment_history&action=full&page='.$pageNum.'">'.$pageNum.'</a></li>';
            }
        }
        echo '
    </ul>
</div>
   </div>
</div>';
    } else {
        echo 'Not found';
    }
}

echofooter();
?>