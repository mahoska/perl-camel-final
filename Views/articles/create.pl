$form=<<HTML;
<h2>Create article</h2>

<form method="post" role="form" action="$ENV{REQUEST_URI}">
     <div class="form-group">
        <label class='control-label' for="login" >Title:</label>
        <input type="text" name="title" class="form-control" id="title"/>
    </div>
 
    <div class="form-group">
         <label class='control-label' for="password" >Content:</label>
         <textarea class="form-control" id="exampleTextarea" rows="3" name="content"></textarea> 
    </div>
    <input type="submit" class="btn btn-success" value ="Create"/>
</form>
HTML

return 1;
