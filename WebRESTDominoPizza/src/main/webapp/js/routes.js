/** Rutas */
dominosApp.config(function ($stateProvider, $urlRouterProvider) {

    $stateProvider
        .state('menu', {
            url: "/menu",
            templateUrl: "partials/menu_promo.html"
        })
        .state('tamanio', {
            url: "/menu/tamanioPizza",
            templateUrl: "partials/menu_tamanio.html"
        })
        .state('ingredientes', {
            url: "/menu/ingredientes",
            templateUrl: "partials/menu_tamanio_ingrediente.html"
        })
        .state('modificarUsuario', {
            url: "/usuario",
            templateUrl: "partials/editar_usuario.html"
        })
        .state('confirmar', {
            url: "/menu/confirmar",
            templateUrl: "partials/menu_confirmar.html"
        });


    $urlRouterProvider.otherwise("/");


});

