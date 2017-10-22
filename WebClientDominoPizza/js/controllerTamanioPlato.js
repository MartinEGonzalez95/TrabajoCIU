angular.module('dominosApp').controller('controllerTamanioPlato', function () {

   /** El plato que me pasan por parámetro */
    this.plato = {
        "pizza": {
            "nombre": "Fugazzeta"
        },
        "precio": 75,
        "tamanio": "Grande"
    };


    /** Le pido al servidor los tamanios */
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
    ];










});


