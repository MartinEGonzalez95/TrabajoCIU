let Pedido = function (nick) {
    this.numero = 0;
    this.cliente = nick || "sinNombre";
    this.platos = [];
    this.horaDeCreacion = Date.now();
    this.aclaraciones = "";
    this.envio;
    this.montoFinal = 0;

};

let Pizza = function (unNombre, unPrecio, ingredientes) {
    this.ingredientes = ingredientes || [];
    this.nombre = unNombre || "";
    this.precio = unPrecio || 0;
};


let Plato = function () {
    this.pizza;
    this.tamanio;
    this.ingredientes = [];
};
