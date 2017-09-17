$err_str = !$message ? "displ" : "";

$regform=<<HTML;
<h2>Registration</h2>


 <div class="alert alert-danger $err_str" role="alert" id="mes">
        <strong>$message</strong>
</div>

<form method="post" role="form" action="index.pl?route=auth/registration">
     <div class="form-group">
        <label class='control-label' for="login" >Login:</label>
        <input type="text" name="login" class="form-control" id="login" placeholder="Enter login" value="$form{'login'}"/>
    </div>
 
    <div class="form-group">
         <label class='control-label' for="password" >Password:</label>
         <input name="password" id="password" class="form-control" type="password" placeholder="Enter password" value=""/>    
    </div>
    <div class="form-group">
         <label class='control-label' for="password_v" >Password(verification):</label>
        <input name="password_v" id="password-v" class="form-control" type="password" placeholder="Enter password" value=""/> 
    </div>
    <div class="form-group">
        <label class='control-label' for="email" >E-mail:</label>
        <input type="text" name="email" class="form-control" id="email" placeholder="Enter email" value="$form{'email'}"/>   
    </div>
    
    <p class='error' id='error'></p>
    <input type="submit" class="btn btn-success" value ="Ragistration"/>
</form>
HTML

return 1;
