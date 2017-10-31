dominosApp.module('apiService', function($http) {
	var getData = function(response) {return response.data};
	
	
	this.pizzas = function(pedido) {
		$http.get('/pizzas')
		.then(getData)
		.catch(function(error) {
			console.log('Error: ' + error);
		});
	}
});