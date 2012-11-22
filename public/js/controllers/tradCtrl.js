
function TradCtrl($scope, Trad) {
	var trads = $scope.trads = Trad.list();

	$scope.edit = function () {
		console.log('Piaf!');
	};

	$scope.search = function () {
		$scope.trads = Trad.list({ k: $scope.filter });
	};

}

TradCtrl.$inject = ['$scope', 'Trad'];
