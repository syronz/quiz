<?php
if(empty($_COOKIE['id']))
  header('Location:index.php');

?>

<!DOCTYPE html>
<html ng-app="quizApp">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Quiz</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link href="dist/img/favicon.png" rel="icon" type="image/x-icon" />
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <!-- <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"> -->
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="dist/css/skins/skin-green.min.css">
    <link rel="stylesheet" href="css/style.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="js/words.js"></script>
    <script src="js/angular.min.js"></script>
    <script src="dist/js/angular-file-upload.min.js"></script>
    
    <script src="js/angular-route.min.js"></script>
    <script src="js/scriptApp.js"></script>
    <script src="js/ctrl/main.js"></script>
    <script src="js/ctrl/perm.js"></script>
    <script src="js/ctrl/user.js"></script>
    <script src="js/ctrl/grade.js"></script>
    <script src="js/ctrl/lecture.js"></script>
    <script src="js/ctrl/question.js"></script>
    <script src="js/ctrl/quizNew.js"></script>
    <script src="js/ctrl/quizProgress.js"></script>
    <script src="js/ctrl/quizResult.js"></script>
    <script src="js/ctrl/quizList.js"></script>
    <script src="js/ctrl/profile.js"></script>
  </head>
  <body class="hold-transition skin-green sidebar-mini">
    <div class="wrapper">

      <!-- Main Header -->
      <header class="main-header">

        <!-- Logo -->
        <a href="" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><b>Q</b>uiz</span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><b>Quiz</b> expertise</span>
        </a>

        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
          </a>
          <!-- Navbar Right Menu -->
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <li class="dropdown user user-menu">
                <!-- Menu Toggle Button -->
                <a href="" class="dropdown-toggle" data-toggle="dropdown">
                  <!-- The user image in the navbar-->
                  <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                  <!-- hidden-xs hides the username on small devices so only the image appears. -->
                  <span class="hidden-xs">Logout</span>
                </a>
                <ul class="dropdown-menu">
                  <!-- The user image in the menu -->
                  <li class="user-header">
                    <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                    <p>
                      Quiz - Web Developer
                      <small>For More Information send email to sabina.diako@gmail.com</small>
                    </p>
                  </li>
                  <li class="user-footer">
                    <div class="pull-left">
                      <!-- <a href="#" class="btn btn-default btn-flat">Profile</a> -->
                    </div>
                    <div class="pull-right">
                      <a href="doLogout.php" class="btn btn-default btn-flat">Sign out</a>
                    </div>
                  </li>
                </ul>
              </li>
              <!-- Control Sidebar Toggle Button -->
            </ul>
          </div>
        </nav>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">

        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">

          <!-- Sidebar Menu -->
          <ul class="sidebar-menu">
            <li class="header"><d>Menu</d></li>
            <li class="treeview">
              <a href="">
                <i class="fa fa-cog"></i>
                <span><d>Admin</d></span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu" style="display: none;">
                <li><a href="#permission/1/25/id/asc"><i class="fa fa-filter"></i> <d>Permission</d></a></li>
                <li><a href="#user/1/25/id/asc"><i class="fa fa-users"></i> <d>Users</d></a></li>
                <li><a href="#grade/1/25/id/asc"><i class="fa fa-signal"></i> <d>Grade</d></a></li>
                <li><a href="#lecture/1/25/id/asc"><i class="fa fa-book"></i> <d>Lecture</d></a></li>
                <li><a href="#question/1/25/id/asc"><i class="fa fa-question-circle"></i> <d>Question</d></a></li>
                <li><a href="#backup/1/25/id/asc"><i class="fa fa-floppy-o"></i> <d>Backup</d></a></li>
              </ul>
            </li>


            <!-- <li><a href="#profile"><i class="fa fa-user"></i> <d>Profile</d></a></li> -->

            <li class="treeview active">
              <a href="">
                <i class="fa fa-graduation-cap"></i>
                <span><d>Quiz</d></span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu menu-open" style="display: block;">
                <li><a href="#quiz/new"><i class="fa fa-plus"></i> <d>New</d></a></li>
                <li><a href="#quizList/1/25/id/DESC"><i class="fa fa-list-ol"></i> <d>List</d></a></li>
                <!-- <li><a href="#quizReport"><i class="fa fa-pie-chart"></i> <d>Report</d></a></li> -->
              </ul>
            </li>

          </ul><!-- /.sidebar-menu -->
        </section>
        <!-- /.sidebar -->
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div ng-view></div>

        <!-- Main content -->
        <section class="content">

          <!-- Your Page Content Here -->

        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->

      <!-- Main Footer -->
      <footer class="main-footer">
        <!-- To the right -->
        <div class="pull-right hidden-xs">
          <b>Quiz</b> expertise <small>-v 2.01</small>
        </div>
        <!-- Default to the left -->
        <strong>Designed By <a href="http://erp14.com">Diako Amir</a>.</strong>
      </footer>

     
    </div><!-- ./wrapper -->

    <!-- REQUIRED JS SCRIPTS -->

    <!-- jQuery 2.1.4 -->
    <script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <!-- AdminLTE App -->
    <script src="dist/js/app.min.js"></script>

    <!-- Optionally, you can add Slimscroll and FastClick plugins.
         Both of these plugins are recommended to enhance the
         user experience. Slimscroll is required when using the
         fixed layout. -->
  </body>
</html>
