<?php


?>


<!doctype html>
<html>
<head>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<link href="dist/img/favicon.png" rel="icon" type="image/x-icon" />
	<script src="js/angular.min.js"></script>
	<script src="js/script.js"></script>

	<style>
		body{
			background-color: #fcf8e3;
		}
		.header{
			text-align: center;
			color: #31708F;
			font-weight: bold;
			font-size: 72px;
			margin-bottom: 40px;
		}
		.akulad{
			color: #FF9800;
		}
	</style>

</head>
<body ng-app="quiz" ng-controller="homeCtrl">

	<h1 class="header">Welcome to <span class="akulad">{</span>Quiz App<span class="akulad">}</span></h1>
	<div class="container">
		<div class="row">
			<div class="red col-md-8">
				<div class="panel panel-success">
					<div class="panel-heading">Instruction</div>
					<div class="panel-body">
					<!-- In this App you can test your knowlage by choosing right answers from our quizes, all question selcted randomly and ... -->

					<video controls muted style="width:100%;">
						<source src="dist/QuizHelp.mp4" type="video/mp4"/>
						Your browser does not support the video tag.
					</video>
					</div>
				</div>
			</div>
			<div class="red col-md-4">
				<div class="panel panel-success" ng-show="login">
					<div class="panel-heading">Login</div>
					<div class="panel-body">
						<form action="doLogin.php" method="post">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Username" name="username" ng-model="username">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" placeholder="Password" name="password"  ng-model="password">
							</div>

							<button class="btn btn-info" ng-disabled="!(username && password)">Login</button>

							<span><a ng-click="tLoggin(0)">Register</a> {{test}}</span>
						</form>
					</div>
				</div>

				<div class="panel panel-success" ng-show="!login">
					<div class="panel-heading">Register</div>
					<div class="panel-body">
						<form name="signUpForm">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Username" name="username" ng-model="register.username" required>
							</div>
							<div class="form-group">
								<input type="password" class="form-control" placeholder="Password" name="password"  ng-model="register.password" required>
							</div>
							<div class="form-group">
								<input type="password" class="form-control" placeholder="Confirm Password" name="confirmPassword"  ng-model="register.confirmPassword" required>
							</div>

							<div class="form-group">
								<input type="text" class="form-control" placeholder="Name" name="name"  ng-model="register.name" required>
							</div>

							<div class="form-group">
								<input type="email" class="form-control" placeholder="Email" name="email"  ng-model="register.email" required>
							</div>

							<p class="text-danger centerAlign">{{error}}</p>

							<button class="btn btn-info"  ng-click="signUp()" ng-disabled="(register.password !=  register.confirmPassword)">Sign Up</button>

							<span><a ng-click="tLoggin(1)">Login</a></span>
						</form>
					</div>
				</div>
			</div>
			<div class="red col-md-4" style="text-align:center;">
				<img src="dist/img/java_icon.png" />
			</div>
		</div>
	</div>
</body>
</html>