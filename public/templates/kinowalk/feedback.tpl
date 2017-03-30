<div class="form-wrap">
	<h1>Support kontaktieren</h1>
	[not-logged]
	<div class="form-item clearfix imp">
        <label>Ihr Name:</label>
		<input type="text" maxlength="35" name="name" placeholder="Ihr Name" />
	</div>
	<div class="form-item clearfix imp">
		<label>Ihre E-Mail:</label>
		<input type="text" maxlength="35" name="email" placeholder="Ihre E-Mail" />
	</div>
	[/not-logged]
	<div class="form-item clearfix">
		<label>Betreff:</label>
		<input type="text" maxlength="45" name="subject" placeholder="Betreff" />
	</div>
	<div class="form-textarea">
		<label>Ihre Nachricht:</label>
		<textarea name="message" style="height: 160px" ></textarea>
	</div>
	[question]
	<div class="form-item clearfix imp">
		<label>Вопрос:</label>
		<div class="form-secur"><div style="margin-bottom:10px;">{question}</div>
        <input type="text" name="question_answer" id="question_answer" placeholder="Впишите ответ на вопрос" required />
		</div>
	</div>
	[/question]
	[sec_code]
	<div class="form-item clearfix imp">
		<label>Sicherheitscode:</label>
		<div class="form-secur">
            <input type="text" name="sec_code" id="sec_code" placeholder="Sicherheitscode" maxlength="45" required />{code}
		</div>
	</div>
	[/sec_code]
	[recaptcha]
	<div class="form-item clearfix imp">
		<label>Введите два слова с картинки:</label>
		<div class="form-secur">
			{recaptcha}
		</div>
	</div>
	[/recaptcha]
	<div class="form-submit">
        <label></label>
		<button name="send_btn" type="submit">Absenden</button>
	</div>
</div>