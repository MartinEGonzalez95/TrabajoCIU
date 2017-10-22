

angular.module('dominosApp').controller('MenuController', function () {


    this.user = {
        "nombre": "Pepito"
    };

    this.promociones = [
        {
            "nombre": "Muzarella",
            "precio": 100,
            "ingredientes": [
                {
                    "nombre": "Muzarella"
                }]
        },
        {
            "nombre": "MuzzaTomate",
            "precio": 150,
            "ingredientes": [
                {
                    "nombre": "Tomate"
                },
                {
                    "nombre": "Muzarella"
                }]
        }
    ];

    this.crearPedido = function(pizza){

        alert(pizza.nombre)
    };
});



