$auth  =  ($is_user) ? "visbl" : "displ";
$_auth = ($is_user) ?  "displ" : "visbl";
$loyout = <<HTML;
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
   
    <title>Camel Team</title>
    <link rel="icon" href="webroot/img/camels.ico" type="image/x-icon"> 
    
    <!-- Bootstrap core CSS -->
    <link href="webroot/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="webroot/css/style.css" />

  </head>

  <body>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <!--nav class="navbar  navbar-fixed-top" role="navigation"-->
      <div class="container">
        <div class="navbar-header">
              <a class="navbar-brand" href="index.pl?route=default/authors">Perl</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="index.pl?route=default/home">Home</a></li>
          </ul>
          
          <form class="navbar-form  navbar-right">
          <div class="form-group">
            <a href="index.pl?route=users/index" class="$auth user_article">My Articles</a>
          </div>
           <div class="form-group">
              <a href="index.pl?route=users/edit" class="$auth btn btn-default  btn-sm">
                <u>You are logged in as:</u> <span class="login"><strong>$user_log</strong></span>
              </a>
            </div>
            <div class="form-group">
              <a href="index.pl?route=auth/logout" class="$auth btn btn-info  btn-sm">Logout</a>
            </div>
          </form>

          <form class="navbar-form  navbar-right login-form $_auth" action="index.pl?route=auth/login"  method="post">
            <div class="form-group">
              <label for="login">Login</label>
              <input type="text" class="form-control input-sm" id="login" placeholder="" name="login">
            </div>
            <div class="form-group">
              <label for="pass">Password</label>
              <input type="password" class="form-control input-sm" id="pass" placeholder="" name="password">
            </div>
            <button type="submit" class="btn btn-info  btn-sm">Login</button>
            <a href="index.pl?route=auth/registration" class="btn btn-info  btn-sm">Registration</a>
          </form>
          
        </div><!--/.nav-collapse -->
      </div><!--/.container -->
    </nav>
      
    
     <div class="container content">
           $content
     </div>

    <!--footer>
        Copyright &copy; 2017
    </footer-->
    
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <script src="webroot/js/jquery.js"></script>
    <script src="webroot/js/script.js"></script>
    <script src="webroot/js/bootstrap.min.js"></script>
  </body>
</html>
HTML

return 1;
