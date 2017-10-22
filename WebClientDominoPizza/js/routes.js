/** Rutas */
angular.module('dominosApp').config(function ($stateProvider, $urlRouterProvider) {


    $stateProvider
        .state('login', {
            url: "/",
            templateUrl: "index.html"
        })


    $urlRouterProvider.otherwise("/");

});

