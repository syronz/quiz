quizApp.controller('quizResultController',function($scope,$routeParams,$rootScope,$http,$location,FileUploader){

	$scope.answers = {'1':'A','2':'B','3':'C','4':'D'};


	$http.get("control/quizCtrl.php?action=getQuizResult&idQuiz="+$routeParams.id).
	success(function(data, status, headers, config) {
		$scope.quizData = data;
		for(i in $scope.quizData.data.quizQuestion){
			var writeAnswer = $scope.quizData.data.quizQuestion[i].right_answer;
			dsh(writeAnswer);

			switch(writeAnswer) {
				case '1':
				$scope.quizData.data.quizQuestion[i].c1 = 'rightAnswer';
				break;
				case '2':
				$scope.quizData.data.quizQuestion[i].c2 = 'rightAnswer';
				break;
				case '3':
				$scope.quizData.data.quizQuestion[i].c3 = 'rightAnswer';
				break;
				case '4':
				$scope.quizData.data.quizQuestion[i].c4 = 'rightAnswer';
				break;
			}


			var selected = $scope.quizData.data.quizQuestion[i].selected;
			if(selected){
				if(selected != writeAnswer){
					switch(selected) {
						case '1':
						$scope.quizData.data.quizQuestion[i].c1 = 'wrongAnswer';
						break;
						case '2':
						$scope.quizData.data.quizQuestion[i].c2 = 'wrongAnswer';
						break;
						case '3':
						$scope.quizData.data.quizQuestion[i].c3 = 'wrongAnswer';
						break;
						case '4':
						$scope.quizData.data.quizQuestion[i].c4 = 'wrongAnswer';
						break;
					}
				}
			}




		}
		dsh($scope.quizData.data.quizQuestion);

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


});