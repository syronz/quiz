function dsh(){
	for(a in arguments)
		console.log(arguments[a]);
}

var quizApp = angular.module('quizApp',['ngRoute','angularFileUpload']);

quizApp.config(function($routeProvider) {
	$routeProvider
	.when('/', {
		templateUrl : 'template/quizNew.html',
		controller  : 'quizNewController'
	})
	.when('/users', {
		templateUrl : 'template/user.html',
		controller  : 'userController'
	})
	.when('/permission/:page/:limit/:sortFiled/:sortType', {
		templateUrl : 'template/perm.html',
		controller  : 'permController'
	})
	.when('/permission/:page/:limit/:sortFiled/:sortType/:search', {
		templateUrl : 'template/perm.html',
		controller  : 'permController'
	})

	.when('/user/:page/:limit/:sortFiled/:sortType', {
		templateUrl : 'template/user.html',
		controller  : 'userController'
	})
	.when('/user/:page/:limit/:sortFiled/:sortType/:search', {
		templateUrl : 'template/user.html',
		controller  : 'userController'
	})

	.when('/grade/:page/:limit/:sortFiled/:sortType', {
		templateUrl : 'template/grade.html',
		controller  : 'gradeController'
	})
	.when('/grade/:page/:limit/:sortFiled/:sortType/:search', {
		templateUrl : 'template/grade.html',
		controller  : 'gradeController'
	})

	.when('/lecture/:page/:limit/:sortFiled/:sortType', {
		templateUrl : 'template/lecture.html',
		controller  : 'lectureController'
	})
	.when('/lecture/:page/:limit/:sortFiled/:sortType/:search', {
		templateUrl : 'template/lecture.html',
		controller  : 'lectureController'
	})

	.when('/question/:page/:limit/:sortFiled/:sortType', {
		templateUrl : 'template/question.html',
		controller  : 'questionController'
	})
	.when('/question/:page/:limit/:sortFiled/:sortType/:search', {
		templateUrl : 'template/question.html',
		controller  : 'questionController'
	})
	.when('/question/add', {
		templateUrl : 'template/questionAdd.html',
		controller  : 'questionController'
	})
	.when('/question/edit/:id', {
		templateUrl : 'template/questionEdit.html',
		controller  : 'questionController'
	})

	.when('/quiz/new', {
		templateUrl : 'template/quizNew.html',
		controller  : 'quizNewController'
	})
	.when('/quiz/progress/:id', {
		templateUrl : 'template/quizProgress.html',
		controller  : 'quizProgressController'
	})
	.when('/quiz/result/:id', {
		templateUrl : 'template/quizResult.html',
		controller  : 'quizResultController'
	})
	.when('/quizList/:page/:limit/:sortFiled/:sortType', {
		templateUrl : 'template/quizList.html',
		controller  : 'quizListController'
	})
	.when('/quizList/:page/:limit/:sortFiled/:sortType/:search', {
		templateUrl : 'template/quizList.html',
		controller  : 'quizListController'
	})

	.when('/profile', {
		templateUrl : 'template/profile.html',
		controller  : 'profileController'
	})


	;


});

quizApp.controller('userController',function($scope,$routeParams){
	console.log('controller OK');

	});


quizApp.directive('d', dictio);
function dictio($rootScope,$http) {
	return {
		restrict: 'E',
		replace: true,
		transclude: true,
		scope: '=',
		template: '<k ng-transclude></k>',
		link: function(scope, element, attrs) {
			if(!$rootScope.langSelected){
				$rootScope.langSelected = 'en';
				$rootScope.tr = 'ltr';
				element[0].textContent = dic(element[0].textContent,$rootScope.langSelected);
			
				// $http.get("control/userCtrl.php?action=getLang")
				// .then(function(response){
				// 	$rootScope.langSelected = response.data;
				// 	element[0].textContent = dic(element[0].textContent,$rootScope.langSelected);
				// });
			}
			else
				element[0].textContent = dic(element[0].textContent,$rootScope.langSelected);
		},
	}
};
function dic(word,lang){
	if(!w[word]){
		// console.log('Not Translate For *'+ word+'*');
		return word;
	}
	else
		return w[word][lang];
};


quizApp.directive('pagination', pagination);
function pagination($rootScope,$location) {
	return {
		restrict: 'E',
		replace: true,
		scope: '=',
		transclude: true,
		// templateUrl: '<button ng-click="tClick()">directiveBTN</button>',
		templateUrl: 'template/pagination.html',
		controller: function ($scope,$routeParams,$rootScope) {
			this.page = 25;
			$scope.limitCount = $routeParams.limit;
			$scope.pLimit = parseInt($routeParams.limit);
			$scope.pPage = parseInt($routeParams.page);
			dsh('showCount',$scope.pPage);

			$scope.tClick = function(){
				console.log('test worked',$routeParams,$rootScope.page);
			}
			$scope.updateLimit = function(v){
				var str = '';
				if($routeParams.search != undefined)
					str = $routeParams.search;
				$location.path($scope.part+'/'+$scope.page+'/'+v+'/'+$scope.sortFiled+'/'+$scope.sortType+'/'+str);
			}
			$scope.goPage = function(page){
				var str = '';
				if($routeParams.search != undefined)
					str = $routeParams.search;
				$location.path($scope.part+'/'+page+'/'+$scope.limit+'/'+$scope.sortFiled+'/'+$scope.sortType+'/'+str);
			}
		},
	}
};


'use strict';
quizApp.directive('ngThumb', ['$window', function($window) {
        var helper = {
            support: !!($window.FileReader && $window.CanvasRenderingContext2D),
            isFile: function(item) {
                return angular.isObject(item) && item instanceof $window.File;
            },
            isImage: function(file) {
                var type =  '|' + file.type.slice(file.type.lastIndexOf('/') + 1) + '|';
                return '|jpg|png|jpeg|bmp|gif|'.indexOf(type) !== -1;
            }
        };

        return {
            restrict: 'A',
            template: '<canvas/>',
            link: function(scope, element, attributes) {
                if (!helper.support) return;

                var params = scope.$eval(attributes.ngThumb);

                if (!helper.isFile(params.file)) return;
                if (!helper.isImage(params.file)) return;

                var canvas = element.find('canvas');
                var reader = new FileReader();

                reader.onload = onLoadFile;
                reader.readAsDataURL(params.file);

                function onLoadFile(event) {
                    var img = new Image();
                    img.onload = onLoadImage;
                    img.src = event.target.result;
                }

                function onLoadImage() {
                    var width = params.width || this.width / this.height * params.height;
                    var height = params.height || this.height / this.width * params.width;
                    canvas.attr({ width: width, height: height });
                    canvas[0].getContext('2d').drawImage(this, 0, 0, width, height);
                }
            }
        };
    }]);
