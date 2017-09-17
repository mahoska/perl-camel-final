if ($error)
{
    $form = '<h2>You do not have permission!</h2>';
}
else
{
$form=<<HTML;
<h2>Edit article</h2>

<form method="post" role="form" action="$ENV{REQUEST_URI}">
     <div class="form-group">
        <label class='control-label' for="login" >Title:</label>
        <input type="text" name="title" class="form-control" id="title" value="$data[0]->{'title'}"/>
    </div>
 
    <div class="form-group">
         <label class='control-label' for="password" >Content:</label>
         <textarea class="form-control" id="exampleTextarea" rows="3" name="content">$data[0]->{'content'}</textarea> 
    </div>
    <input type="submit" class="btn btn-success" value ="Edit"/>
</form>
HTML
}
return 1;
