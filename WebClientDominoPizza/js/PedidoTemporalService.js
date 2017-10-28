angular.module('dominosApp').service('PedidoTemporalService', function () {

    this.pedido;

    this.getPedido = function () {
        return this.pedido;
    };
    //this.obtenerPedido = function (id) {this.pedido = servidor.getPedido(id);};

    this.crearPedido = function (cliente) {
        let pedido = new Pedido();
        pedido.cliente = cliente;
        this.pedido = pedido;
        return pedido;
    };

    this.estadoDePedidoParaCrear = function (nick) {


    };


    this.agregarPlato = function (plato) {
        this.pedido.platos.push(plato);
    };

    this.asignarNumero = function (unNumero) {
        this.pedido.numero = unNumero;
    };

    this.aclaraciones = function (aclaracion) {
        this.pedido.aclaraciones = aclaracion;
    };

    this.envio = function (envio) {
        this.pedido.envio = envio;
    };

    this.nick = function () {
        return this.pedido.cliente
    };


});
