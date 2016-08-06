quizApp.controller('profileController',function($scope,$routeParams,$rootScope,$http,$location,FileUploader){

	$scope.lectureList = null;
	$scope.getlectures = function(){
		if($scope.lectureList == null){
			$http.get("control/lectureCtrl.php?action=lectureList").
			success(function(data, status, headers, config) {
				$scope.lectureList = data;
			}).
			error(function(data, status, headers, config) {
				$log.info(data);
			});
		}
	}
	$scope.getlectures();

	$scope.gradeList = null;
	$scope.getgrades = function(){
		if($scope.gradeList == null){
			$http.get("control/gradeCtrl.php?action=gradeList").
			success(function(data, status, headers, config) {
				$scope.gradeList = data;
			}).
			error(function(data, status, headers, config) {
				$log.info(data);
			});
		}
	}
	$scope.getgrades();


	$scope.generateQuiz = function(){
		$http.post("control/quizCtrl.php?action=generateQuiz",$scope.quiz).
		success(function(data, status, headers, config) {
			dsh(data);
			if(data.result)
				$location.path('quiz/progress/'+data.idQuiz);
			else{
				$scope.errorShow = true;
				$scope.errorMessage = data.message;
			}
		}).
		error(function(data, status, headers, config) {
			$log.info(data);
		});
	}

	$scope.toggleError = function(){
		$scope.errorShow = !$scope.errorShow;
	}

});