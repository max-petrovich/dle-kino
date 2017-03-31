<div class="user-prof">
	<div class="up-first" style="height: 40px; text-indent: 20px; line-height: 40px; padding: 0">
		<h1 class="nowrap">Nutzer: [xfgiven_first_name][xfvalue_first_name][/xfgiven_first_name] [xfgiven_last_name][xfvalue_last_name][/xfgiven_last_name]</h1>
	</div>
	<div style="background: #fff;" class="form-wrap up-edit">
		<div class="form-item clearfix">
			<label>altes Passwort:</label>
			<input type="password" name="altpass" placeholder="altes Passwort" />
		</div>
		<div class="form-item clearfix">
			<label>neues Passwort:</label>
			<input type="password" name="password1" placeholder="neues Passwort" />
		</div>
		<div class="form-item clearfix">
			<label>neues Passwort wiederholen:</label>
			<input type="password" name="password2" placeholder="neues Passwort wiederholen" />
		</div>
		<div class="form-submit">
			<button name="submit" type="submit" id="submit" value="submit">Speichern</button>
			[not-group=6]<button name="submit" type="submit" value="delete" style="background:red; float:right;" onclick="if (!confirm('Account löschen?')) return false;">Account lösche</button>[/not-group]
		</div>
	</div>
</div>