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
        })
        .state('ingrediente',{
            url: "/menu/ingrediente",
            templateUrl:"partials/menu_ingrediente.html"
        })
        .state('confirmar',{
            url: "/menu/confirmar",
            templateUrl:"partials/menu_confirmar.html"
        });


    $urlRouterProvider.otherwise("/menu");


});

