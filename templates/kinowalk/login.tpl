<div class="overlay" id="overlay">  
[not-group=5]
	<div class="login-box" id="login-box">
		<div class="login-title">{login}</div>
		<div class="login-avatar">
	
				[group=1]<a href="{admin-link}" target="_blank">Админпанель</a>[/group]
		</div>
		<ul class="login-menu">
						<li><a href="{profile-link}">Mein Account</a></li>
						<li><a href="{favorites-link}">Meine Favoriten ({favorite-count})</a></li>
						<li><a href="{logout-link}">Abmelden</a></li>
		</ul>
	</div>
[/not-group]
[group=5]
	<div class="login-box" id="login-box">
		<div class="login-title">Anmelden</div>
		<div class="login-form">
			<form method="post">
				<div class="login-input">
					<input type="text" name="login_name" id="login_name" placeholder="Benutzername"/>
				</div>
				<div class="login-input">
					<input type="password" name="login_password" id="login_password" placeholder="Passwort" />
				</div>
				<div class="login-button">
					<button onclick="submit();" type="submit" title="Anmelden">Anmelden</button>
					<input name="login" type="hidden" id="login" value="submit" />
				</div>
			</form>
		</div>
	</div>																																																																																																																																																																							
[/group]
</div>