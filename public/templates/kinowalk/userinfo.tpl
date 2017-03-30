<div class="user-prof">
	<div class="up-first" style="height: 40px; text-indent: 20px; line-height: 40px; padding: 0">
		<h1 class="nowrap">Пользователь: {usertitle}</h1>
	</div>
	<div style="background: #fff;" class="form-wrap up-edit">
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
			[not-group=6]<button name="submit" type="submit" value="delete" style="background:red; float:right;" onclick="if (!confirm('Вы точно хотите удалит аккаунт? Это действите невозможно отменить!')) return false;">Удалить аккаунт</button>[/not-group]
		</div>
	</div>
</div>