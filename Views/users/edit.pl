
if ($error)
{
    $message = '
        <div class="alert alert-danger $err_str" role="alert" id="mes">
            <strong>'.$error.'</strong>
        </div>';
}

$form=<<HTML;
<h2>Edit $data[0]->{'login'}</h2>
$message
<form method="post" role="form" action="$ENV{REQUEST_URI}">
    <div class="form-group">
        <label class='control-label' for="title" >Email:</label>
        <input type="text" name="email" class="form-control" id="email" value="$data[0]->{'email'}"/>
    </div>

    <div class="form-group">
        <label class='control-label' for="password" >Password:</label>
        <input name="password" id="password" class="form-control" type="password" placeholder="Enter password"/>
    </div>
    <div class="form-group">
        <label class='control-label' for="password_v" >Password(verification):</label>
        <input name="password_v" id="password-v" class="form-control" type="password" placeholder="Enter password"/>
    </div>
    <input type="submit" class="btn btn-success" value ="Edit"/>
</form>
HTML

return 1;
