let Pedido = function (nick) {
    this.numero = 0;
    this.cliente = nick || "sinNombre";
    this.platos = [{
        "nombre": "Muzarella",
        "precio": 100,
        "ingredientes": [
            {
                "nombre": "Muzarella"
            }]
    }
    ];
    this.horaDeCreacion = Date.now();
    this.aclaraciones = "";
    this.envio;
    this.montoFinal = 0;

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
