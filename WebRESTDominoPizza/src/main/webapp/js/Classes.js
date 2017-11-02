let Pedido = function (nick) {
    this.numero = 0;
    this.cliente = nick || "sinNombre";
    this.platos = [{
        "nombre": "Muzarella",
        "precioBase": 100,
        "ingredientes": [
            {
                "nombre": "Muzarella"
            }]
    }
    ];
    this.horaDeCreacion = Date.now();
    this.aclaraciones = "";
    this.delivery = {
        "nombre": "Delivery",
        "precio": 15,
        "valor": false
    };

    this.retiroPorLocal = {
        "nombre": "RetiroPorLocal",
        "precio": 0,
        "valor": false
    };
    this.montoFinal = 555;

    this.calcularMontoFinal = function(){

    }
    
};

let Ingrediente = function (json) {
    angular.extend(this, json);

};

let Pizza = function (json) {
    angular.extend(this, json);
};


let Plato = function () {
    this.pizza;
    this.tamanio = new Tamanio("Grande", 1);
    this.ingredientesExtras = [];
};

let Tamanio = function (json) {
    angular.extend(this, json);
};
