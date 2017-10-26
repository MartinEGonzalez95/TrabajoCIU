/** Rutas */
dominosApp.config(function ($stateProvider, $urlRouterProvider) {

    $stateProvider
        .state('login', {
            url: "/login",
            templateUrl: "partials/login.html"
        })
        .state('menu', {
            url: "/menu",
            templateUrl: "partials/menu_promo.html"
        })
        .state('tamanio', {
            url: "/menu/tamanio",
            templateUrl: "partials/menu_tamanio.html"
        });


    $urlRouterProvider.otherwise("/menu");


});

