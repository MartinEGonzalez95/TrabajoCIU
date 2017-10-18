let app = angular.module('pizzaTamanio', []);


app.controller('PizzaTamanioController', function () {

    this.user = {
        "nick": "Pepito"
    };

    this.plato = {
        "pizza": {
            "nombre": "Fugazzeta"
        },
        "precio": 75,
        "tamanio": "Grande"
    }

    this.tamanios = [
        {
            "nombre": "Porcion",
            "valor": 0.125
        },
        {
            "nombre": "Chica",
            "valor": 0.50
        },
        {
            "nombre": "Grande",
            "valor": 1
        },
        {
            "nombre": "Familiar",
            "valor": 1.25
        }
    ]

};


