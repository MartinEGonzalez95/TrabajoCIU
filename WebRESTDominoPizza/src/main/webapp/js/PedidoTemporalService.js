angular.module('dominosApp').service('PedidoTemporalService', function () {

    this.pedido;

    /** Este metodo permite dos cosas, obtener un pedido activo temporal o crear uno nuevo*/
    this.getPedido = function (user) {

        if (this.hayPedidoActivo(user)) {
            return this.pedido;
        } else {
            return this.crearPedido(user);
        }

    };

    this.hayPedidoActivo = function(user){
        //si no es null el pedido y tiene el mismo usuario
        return this.pedido && this.pedido.cliente == user;
    };


    this.crearPedido = function (cliente) {
        let pedido = new Pedido(cliente);
        pedido.cliente = cliente;
        this.pedido = pedido;
        return pedido;
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
