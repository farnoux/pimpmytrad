app.factory('Trad', ['$resource', function($resource) {

	return $resource('/trads', {}, {
		list: { method: 'GET', isArray: true }
	});

	// return {
	// 	get: function() {
	// 		return [
	// 				{ key: "la clef", value: "la value" }
	// 			, { key: "hahaha", value: "hohoho" }
	// 		]
	// 	}

	// };
}]);
