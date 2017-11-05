let Pedido = function (nick) {
    this.numero = 0;
    this.cliente = nick || "sinNombre";
    this.platos = [];
    this.horaDeCreacion = Date.now();
    this.aclaraciones = "";
    this.montoFinal = 0;
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

    this.montoFinalPedido = function(){
        return this.platos.map(plato => plato.precioPlato()).reduce((a, b) => a + b, 0) || 0
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

    this.precioEnBaseAlTamanio = function(){

        if (this.ingredientesExtras.isEmpty) {
            return this.pizza.precioBase * this.tamanio.valor
        }
        return 70 * this.tamanio.valor
    };

    this.precioIngredientesExtras = function(){
        return this.ingredientesExtras.map(ingrediente => ingrediente.precio).reduce((a, b) => a + b, 0)
    };

    this.precioPlato = function(){
        return this.precioEnBaseAlTamanio() + this.precioIngredientesExtras()
    };

};

let Tamanio = function (json) {
    angular.extend(this, json);
};
