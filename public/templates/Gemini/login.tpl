[not-group=5]
<ul class="reset loginbox">
	<li class="lvsep"><a id="loginlink" href="#"><i>Привет, {login}!</i></a></li>
	<li class="loginbtn"><a href="{logout-link}"><b>Выход</b></a></li>
</ul>
<div id="logindialog" title="{login}" style="display:none;">
	<div class="userinfo">
		<div class="lcol">
			<div style="margin: 0" class="avatar"><a href="{profile-link}"><img src="{foto}" alt="{login}" /></a></div>
		</div>
		<div class="rcol">
			<ul class="reset">
[admin-link]<li><a href="{admin-link}" target="_blank"><b>Админпанель</b></a></li>[/admin-link]
				<li><a href="{addnews-link}"><b>Добавить новость</b></a></li>
				<li><a href="{pm-link}">Сообщения: ({new-pm} | {all-pm})</a></li>
				<li><a href="{profile-link}">Мой профиль</a></li>
				<li><a href="{favorites-link}">Мои закладки</a></li>
				<li><a href="{stats-link}">Статистика</a></li>
			</ul>
		</div>
		<div class="clr"></div>
	</div>
</div>
[/not-group]
[group=5]
<ul class="reset loginbox">
	<li class="lvsep"><a href="{registration-link}"><i>Регистрация</i></a></li>
	<li class="loginbtn"><a id="loginlink" href="#"><b>Войти</b></a></li>
</ul>
<div id="logindialog" title="Авторизация" style="display:none;">
	<form method="post" action="">
		<div class="logform">
			<ul class="reset">
				<li class="lfield"><label for="login_name">{login-method}</label><br /><input type="text" name="login_name" id="login_name" /></li>
				<li class="lfield lfpas"><label for="login_password">Пароль (<a href="{lostpassword-link}">Забыли?</a>):</label><br /><input type="password" name="login_password" id="login_password" /></li>
				<li class="lfield lfchek"><input type="checkbox" name="login_not_save" id="login_not_save" value="1"/><label for="login_not_save">&nbsp;Чужой компьютер</label></li>
				<li class="lfield lfchek"><div class="sociallogin">
					[vk]<a href="{vk_url}" target="_blank"><img src="{THEME}/images/social/vkontakte.gif" /></a>[/vk]
					[odnoklassniki]<a href="{odnoklassniki_url}" target="_blank"><img src="{THEME}/images/social/odnoklassniki.gif" /></a>[/odnoklassniki]
					[facebook]<a href="{facebook_url}" target="_blank"><img src="{THEME}/images/social/facebook.gif" /></a>[/facebook]
					[mailru]<a href="{mailru_url}" target="_blank"><img src="{THEME}/images/social/mailru.gif" /></a>[/mailru]
					[yandex]<a href="{yandex_url}" target="_blank"><img src="{THEME}/images/social/yandex.gif" /></a>[/yandex]
					[google]<a href="{google_url}" target="_blank"><img src="{THEME}/images/social/google.gif" /></a>[/google]
				</div></li>
				<li class="lbtn"><button class="fbutton" onclick="submit();" type="submit" title="Войти"><span>Войти</span></button></li>
			</ul>
			<input name="login" type="hidden" id="login" value="submit" />
		</div>
	</form>
</div>
[/group]