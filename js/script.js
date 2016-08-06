function dsh(){
	for(a in arguments)
		console.log(arguments[a]);
}

var quiz = angular.module('quiz',[]);

quiz.controller('homeCtrl',function($scope,$http){
	$scope.login = true;

	$scope.tLoggin = function(b){
		$scope.login = b;
	}

	
	$scope.signUp = function(){
		$http.post("control/userCtrl.php?action=signUp",$scope.register)
		.then(function(response){
			console.log(response);
			if(response.data.result){
				console.log(response);
				window.location = 'app.php';
			}
			else{
				$scope.error = response.data.message;
			}
		});


	}

});




