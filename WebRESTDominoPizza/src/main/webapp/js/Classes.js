let Pedido = function (nick) {
    this.numero = 0;
    this.platos = [];
    this.cliente = nick || "sinNombre";
    this.aclaraciones = "";

    this.formaDeEnvio = new RetiroPorLocal();

    this.fechaDeCreacion;
    this.montoFinalPedido = function () {
        let precio = this.platos.map(plato => plato.precioPlato()).reduce((a, b) => a + b, 0) || 0;
        return this.formaDeEnvio.costo + precio
    };

};

let Delivery = function () {
    this.costo = 15;
    this.direccion = "";
    this.nombre = "Delivery"
};

let RetiroPorLocal = function () {
    this.costo = 0;
    this.nombre = "RetiroPorLocal"
};

let Ingrediente = function (json) {
    angular.extend(this, json);

    this.precioFinal = function () {

		if (this.distribucion == "Todo") {
			return this.precio
		}
		return this.precio / 2
	}

};

let Pizza = function (json) {
    angular.extend(this, json);
};


let Plato = function () {
    this.pizza;
    this.tamanio = new Tamanio("Grande", 1);
    this.ingredientesExtras = [];

    this.precioEnBaseAlTamanio = function () {

        if (this.ingredientesExtras.isEmpty) {
            return this.pizza.precioBase * this.tamanio.valor
        }
        return 70 * this.tamanio.valor
    };

    this.precioIngredientesExtras = function () {
        return this.ingredientesExtras.map(ingrediente => ingrediente.precioFinal()).reduce((a, b) => a + b, 0)
    };

    this.precioPlato = function () {
        return this.precioEnBaseAlTamanio() + this.precioIngredientesExtras()
    };

};

let Tamanio = function (json) {
    angular.extend(this, json);
};


let Cliente = function (json) {
    angular.extend(this, json);
};
