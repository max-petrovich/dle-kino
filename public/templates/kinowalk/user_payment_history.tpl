<form method="post" action="" enctype="multipart/form-data" onsubmit="ShowLoading();">
    {include file="engine/modules/user_payment_history.php"}
    <div class="user-prof">
        <div class="up-first" style="height: 40px; text-indent: 20px; line-height: 40px; padding: 0">
            <h1 class="nowrap">{description}</h1>
        </div>
        <div style="background: #fff;" class="form-wrap up-edit">
            <div class="form-item clearfix">
                <label>Name:</label>
                <input type="text" name="user_name" placeholder="Your name" required>
            </div>
            <div class="form-item clearfix">
                <label>Attachment:</label>
                <input type="file" name="file" required>
            </div>
            <div class="form-submit">
                <button type="submit" id="submit" value="submit">Submit</button>
            </div>
        </div>
    </div>
</form>