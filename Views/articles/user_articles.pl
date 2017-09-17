my $list ="
<div class='row createButton'>
    <div class='col-md-12'>
        <a href='?route=articles/create'><button class='btn btn-info btn-sm'>Create Article</button></a>
    </div>
</div>
<table class='table table-hover table-striped'>
    <tr>
        <th>Title</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
";
foreach $arg(@data)
{
     $list.="<td>".$arg->{'title'}."</td>";
     $list.="<td ><a href='?route=articles/edit/".$arg->{'id'}."'>";
     $list.="<button class='btn btn-success'><span class='glyphicon glyphicon-wrench' aria-hidden='true'></span></button></a></td>";
     $list.="<td><a class='btn btn-success' href='?route=articles/delete/".$arg->{'id'}."'><span class='glyphicon glyphicon-trash' aria-hidden='true'></span></a>";
     $list.= "</form></td></tr>";
}
$list .= "</table>";


$content = <<HTML;
    $list
HTML

return 1;
