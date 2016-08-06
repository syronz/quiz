quizApp.controller('quizProgressController',function($scope,$routeParams,$rootScope,$http,$location,FileUploader,$interval){


	$http.get("control/quizCtrl.php?action=getQuiz&idQuiz="+$routeParams.id).
	success(function(data, status, headers, config) {
		$scope.quizData = data;
	}).
	error(function(data, status, headers, config) {
		$log.info(data);
	});


	$scope.submitQuiz = function(){
		console.log($scope.quizData);
		$http.post("control/quizCtrl.php?action=submitQuiz",$scope.quizData).
		success(function(data, status, headers, config) {
			dsh(data);
			if(data.result)
				$location.path('quiz/result/'+data.idQuiz);
			else{
				$scope.errorShow = true;
				$scope.errorMessage = data.message;
			}
		}).
		error(function(data, status, headers, config) {
			$log.info(data);
		});
	}

	$scope.rTime = 3600;
	var stop;
	$scope.timer = function() {
		if ( angular.isDefined(stop) ) return;

		stop = $interval(function() {
			if ($scope.rTime > 0) {
				$scope.rTime = $scope.rTime - 1;
			} else {
				$scope.stopTimer();
				$scope.submitQuiz();
			}
		}, 1000);
	};
	$scope.timer();

	$scope.stopTimer = function() {
		if (angular.isDefined(stop)) {
			$interval.cancel(stop);
			stop = undefined;
		}
	};


});