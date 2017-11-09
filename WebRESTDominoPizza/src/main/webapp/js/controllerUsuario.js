dominosApp.controller('ControllerUsuario', function ($state,UserService, PedidoService,PedidoTemporalService) {

    let self = this;

    this.usuario = UserService.usuarioLogueado();


    this.nombre = "";
    this.email = "";
    this.direccion = "";

    this.pedidosAnteriores = [];

    this.obtenerPedidos = function () {

        PedidoService.obtenerPedidosAnterioresDe(this.usuario.nick)
            .then(function (data) {
                self.pedidosAnteriores = data;
            })
            .catch(console.log("un error :D "))
    };

    this.obtenerPedidos();

    this.repetirPedido = function (pedido) {
        /*ir a la ventana confirmacionPedido*/
        PedidoTemporalService.pedido = pedido;
        $state('confirmar');

    };

    this.setearCambios = function () {

        let jsonUsuario = {
            "nick": self.usuario.nick,
            "nombre": self.nombre,
            "email": self.email,
            "direccion": self.direccion
        };

    };

});