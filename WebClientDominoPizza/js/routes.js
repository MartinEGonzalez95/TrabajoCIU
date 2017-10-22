
angular.module('dominosApp').config(function ($stateProvider, $urlRouterProvider) {


    $stateProvider
        .state('login', {
            url: "/login",
            templateUrl: "login.html"
        })
        .state('crearPedido', {
            url: "/menu/crearPedido",
            templateUrl: "partials/crearPedido.html"
        });

    $urlRouterProvider.otherwise("/login");

});

