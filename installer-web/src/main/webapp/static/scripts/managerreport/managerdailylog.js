var app = angular.module('app',// ,'ifu.workerselect'
[ 'treeGrid', 'ui.bootstrap', 'ifu.template', 'ifu.form', 'ifu.cityselect2',
		'ifu.util' ]);

app.controller('ManagerReportController',//
[
		'$scope',
		'$http',
		'$window',
		'$uibModal',
		'UrlUtil',
		function($scope, $http, $window, $uibModal, UrlUtil) {
			$scope.goBack = function(reportType) {
				if(reportType=='日报')
					{
					$window.location.href = UrlUtil
					.transform('managerDailylog/managerDailyReportListlog.do?pageNo=' + pageNo);
					}
				if(reportType=='周报')
				{
					$window.location.href = UrlUtil
					.transform('managerDailylog/managerWeeklyReportListlog.do?pageNo=' + pageNo);
				}
				if(reportType=='月报')
				{
					$window.location.href = UrlUtil
					.transform('managerDailylog/managerMonthlyReportListlog.do?pageNo=' + pageNo);
				}
				if(reportType=='季报')
				{
					$window.location.href = UrlUtil
					.transform('managerDailylog/managerQuarterlyReportListlog.do?pageNo=' + pageNo);
				}
			}
		} ]);
