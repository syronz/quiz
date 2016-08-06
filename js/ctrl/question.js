quizApp.controller('questionController',function($scope,$routeParams,$rootScope,$http,$location,FileUploader){
	console.log('controller OK question');
	$scope.dic = function(word){
		return dic(word,$rootScope.langSelected);
	}

	$scope.saveModal = function(){
		if($scope.modalType == 'add'){
			$scope.modal.id_question = $routeParams.id;
			$http.post("control/answerCtrl.php?action=add",$scope.modal).
			success(function(data, status, headers, config) {
				if(data.result){

					$scope.modal = {};
					$('#appModal').modal('hide');
					$scope.listAnswers();
				}
				else{
					console.log(data);
					$scope.errorMessage = data.message;
				}
			}).
			error(function(data, status, headers, config) {
				$log.info('error',data, status, headers, config);
			});
		}
		else if($scope.modalType == 'edit'){
			$http.post("control/answerCtrl.php?action=edit",$scope.modal).
			success(function(data, status, headers, config) {
				if(data.result){
					$scope.modal = {};
					$('#appModal').modal('hide');
					$scope.listAnswers();
				}
				else{
					dsh(data);
					$scope.errorMessage = data.message;
				}
			}).
			error(function(data, status, headers, config) {
				$log.info('error',data, status, headers, config);
			});
		}
		else if($scope.modalType == 'delete'){
			$http.post("control/questionCtrl.php?action=delete",$scope.modal).
			success(function(data, status, headers, config) {
				if(data.result){
					$scope.modal = {};
					$('#appModal').modal('hide');
					$scope.list();
				}
				else{
					dsh(data);
					$scope.errorMessage = data.message;
				}
			}).
			error(function(data, status, headers, config) {
				$log.info('error',data, status, headers, config);
			});
		}
		else if($scope.modalType == 'deleteAnswer'){
			$http.post("control/answerCtrl.php?action=delete",$scope.modal).
			success(function(data, status, headers, config) {
				if(data.result){
					$scope.modal = {};
					$('#appModal').modal('hide');
					$scope.listAnswers();
				}
				else{
					dsh(data);
					$scope.errorMessage = data.message;
				}
			}).
			error(function(data, status, headers, config) {
				$log.info('error',data, status, headers, config);
			});
		}
		// dsh($scope.modal,52);
	};


	$scope.questionList = null;
	$rootScope.part = 'question';

	$scope.sortFiled = $routeParams.sortFiled;
	$scope.sortType = $routeParams.sortType;
	var order = $scope.sortFiled+' '+$scope.sortType;


	$scope.page = parseInt($routeParams.page);
	$scope.limit = parseInt($routeParams.limit);
	var limitPage = (($scope.page - 1) * $scope.limit)+','+$scope.limit;

	var str = '';
	if($routeParams.search != undefined)
		str = $routeParams.search;

	$scope.list = function(){
		$rootScope.loading = true;
		$http.get("control/questionCtrl.php?action=list&order="+order+"&limit="+limitPage+"&search="+str).
		success(function(data, status, headers, config) {
			dsh(data,data.result == false);
			if(data.result == false){
				$scope.error = true;
				$scope.errorlist = data.message;
			}
			else{
				$scope.questionList = data.rows;
				$scope.count = data.count;
			}
			
			$rootScope.loading = false;
		}).
		error(function(data, status, headers, config) {
			$log.info(data);
		});
	}
	

	$scope.sorting = function(sort){
		dsh(sort);
		if($scope.sortType != 'DESC')
			$scope.sortType = 'DESC';
		else
			$scope.sortType = 'ASC';
		$scope.sortFiled = sort;
		order = $scope.sortFiled+' '+$scope.sortType;
		$location.path($scope.part+'/'+$scope.page+'/'+$scope.limit+'/'+$scope.sortFiled+'/'+$scope.sortType+'/'+str);
		// $scope.list();
	}

	$scope.checkSort = function(sort){
		if(sort == $scope.sortFiled)
			return 'sorting_'+$scope.sortType.toLowerCase();
		return 'sorting';
	}

	$scope.addAnswer = function(){
		
		$('#appModal').modal('show');
		$scope.errorMessage = null;
		$scope.modalType = 'add';
		$scope.modalTitle = dic('Add',$rootScope.langSelected) + ' ' + dic('Answer',$rootScope.langSelected);
		$scope.modal = {result:'0'};
	}

	$scope.delete = function(item){
		$scope.errorMessage = null;
		$scope.modalType = 'delete';
		$scope.modalTitle = dic('Delete',$rootScope.langSelected) + ' ' + dic('question',$rootScope.langSelected);
		$scope.modal = item;
	}

	$scope.edit = function(item){
		$location.path('/question/edit/'+item.id)
	}



	/*------------ for add */
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
	$scope.errorShow = false;
	$scope.saveQuestion = function(){
		dsh($scope.question);
		$http.post("control/questionCtrl.php?action=add",$scope.question).
		success(function(data, status, headers, config) {
			if(data.result){
				dsh(data);
				$location.path('question/edit/'+data.id);
			}
			else{
				dsh(data);
				$scope.errorShow = true;
				$scope.errorMessage = data.message;
			}
		}).
		error(function(data, status, headers, config) {
			$log.info('error',data, status, headers, config);
		});
	}

	$scope.toggleError = function(){
		$scope.errorShow = !$scope.errorShow;
	}

	//-------------------------------------------------------------- end Add


	//-------------------------------------------------------------- start Edit
	$scope.getQuestion = function(){
		$http.get("control/questionCtrl.php?action=getQuestion&id="+$routeParams.id).
		success(function(data, status, headers, config) {
			$scope.question = data;
		}).
		error(function(data, status, headers, config) {
			$log.info(data);
		});

		$scope.listAnswers();
	}

	$scope.listAnswers = function(){
		$rootScope.loading = true;
		$http.get("control/answerCtrl.php?action=listByQuestion&idQuestion="+$routeParams.id).
		success(function(data, status, headers, config) {
			if(data.result == false){
				$scope.error = true;
				$scope.errorlist = data.message;
			}
			else{
				$scope.answerList = data.rows;
				$scope.count = data.count;
			}
			
			$rootScope.loading = false;
		}).
		error(function(data, status, headers, config) {
			$log.info(data);
		});
	}

	$scope.deleteAnswer = function(item){
		$scope.errorMessage = null;
		$scope.modalType = 'deleteAnswer';
		$scope.modalTitle = dic('Delete',$rootScope.langSelected) + ' ' + dic('Answer',$rootScope.langSelected);
		$scope.modal = item;
	}

	$scope.editAnswer = function(item){
		$scope.errorMessage = null;
		$scope.modalType = 'edit';
		$scope.modalTitle = dic('Edit',$rootScope.langSelected) + ' ' + dic('Answer',$rootScope.langSelected);
		$scope.modal = item;
		dsh(item);
	}

	$scope.deleteImage = function(){
		$http.post("control/questionCtrl.php?action=deleteImage",{idQuestion:$routeParams.id}).
			success(function(data, status, headers, config) {
				if(data.result){
					$scope.question = false;
					dsh(data);
				}
				else{
					dsh(data);
				}
			}).
			error(function(data, status, headers, config) {
				$log.info('error',data, status, headers, config);
			});
	}

	
	$scope.saveChanges = function(){
		dsh($scope.question);
		$http.post("control/questionCtrl.php?action=edit",$scope.question).
		success(function(data, status, headers, config) {
			if(data.result){
				dsh(data);
				$location.path('question/1/25/id/asc');
			}
			else{
				dsh(data);
				$scope.errorShow = true;
				$scope.errorMessage = data.message;
			}
		}).
		error(function(data, status, headers, config) {
			$log.info('error',data, status, headers, config);
		});
	}


	var uploader = $scope.uploader = new FileUploader({
            // url: 'upload.php' edited
            url: 'control/questionCtrl.php?action=addImage&idQuestion='+$routeParams.id
        });

        // FILTERS

        uploader.filters.push({
        	name: 'imageFilter',
        	fn: function(item /*{File|FileLikeObject}*/, options) {
        		var type = '|' + item.type.slice(item.type.lastIndexOf('/') + 1) + '|';
        		return '|jpg|png|jpeg|bmp|gif|'.indexOf(type) !== -1;
        	}
        });

        // CALLBACKS

        uploader.onWhenAddingFileFailed = function(item /*{File|FileLikeObject}*/, filter, options) {
        	console.info('onWhenAddingFileFailed', item, filter, options);
        };
        uploader.onAfterAddingFile = function(fileItem) {
        	console.info('onAfterAddingFile', fileItem);
        };
        uploader.onAfterAddingAll = function(addedFileItems) {
        	console.info('onAfterAddingAll', addedFileItems);
        };
        uploader.onBeforeUploadItem = function(item) {
        	console.info('onBeforeUploadItem', item);
        };
        uploader.onProgressItem = function(fileItem, progress) {
        	console.info('onProgressItem', fileItem, progress);
        };
        uploader.onProgressAll = function(progress) {
        	console.info('onProgressAll', progress);
        };
        uploader.onSuccessItem = function(fileItem, response, status, headers) {
        	console.info('onSuccessItem', fileItem, response, status, headers);
        };
        uploader.onErrorItem = function(fileItem, response, status, headers) {
        	console.info('onErrorItem', fileItem, response, status, headers);
        };
        uploader.onCancelItem = function(fileItem, response, status, headers) {
        	console.info('onCancelItem', fileItem, response, status, headers);
        };
        uploader.onCompleteItem = function(fileItem, response, status, headers) {
        	console.info('onCompleteItem', fileItem, response, status, headers);
        };
        uploader.onCompleteAll = function() {
        	console.info('onCompleteAll');
        };

        console.info('uploader', uploader);

    });