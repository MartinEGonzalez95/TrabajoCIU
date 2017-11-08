let Pedido = function (nick) {
    this.numero = 0;
    this.platos = [];
    this.cliente = nick || "sinNombre";
    //this.horaDeCreacion = Date.now();
    this.aclaraciones = "";
    //this.montoFinal = 0;
    this.formaDeEnvio = new RetiroPorLocal();

    this.montoFinalPedido = function(){
        let precio = this.platos.map(plato => plato.precioPlato()).reduce((a, b) => a + b, 0) || 0;
        return this.precioDeEnvio() + precio
    };

    this.precioDeEnvio = function(){
        if(this.formaDeEnvio.tipo === "RetiroPorLocal"){
            return 0
        }else{
            return 15
        }
    };
};

let Delivery = function(){
    this.tipo = "Delivery";
    this.direccion = "";
};

let RetiroPorLocal = function(){
    this.tipo = "RetiroPorLocal";
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


let Cliente = function(json){
    angular.extend(this, json);
};
