[group=6]{include file="premium.tpl"}[/group]
<div class="user-prof">
	<div class="up-first">
		<h1 class="nowrap">Пользователь: {usertitle}</h1>
	</div>
	[not-logged]<div class="up-edit"> {edituser} </div>[/not-logged]
</div>


<div id="options" style="display:none; margin-bottom: 30px" class="form-wrap">
	<h1>Редактирование профиля:</h1>
	<div class="form-item clearfix">
		<label>Старый пароль:</label>
		<input type="password" name="altpass" placeholder="Старый пароль" />
	</div>
	<div class="form-item clearfix">
		<label>Новый пароль:</label>
		<input type="password" name="password1" placeholder="Новый пароль" />
	</div>
	<div class="form-item clearfix">
		<label>Повторите пароль:</label>
		<input type="password" name="password2" placeholder="Повторите Новый пароль" />
	</div>

	<div class="form-xfield">
		<table class="tableform">{xfields}</table>
	</div>
	<div class="form-submit">
		<button name="submit" type="submit" id="submit" value="submit">Отправить</button>
		<button name="submit" type="submit" value="delete" style="background:red; float:right;" onclick="if (!confirm('Вы точно хотите удалит аккаунт? Это действите невозможно отменить!')) return false;">Удалить аккаунт</button>
	</div>
</div>