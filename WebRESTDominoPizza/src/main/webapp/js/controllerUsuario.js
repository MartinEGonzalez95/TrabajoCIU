dominosApp.controller('ControllerUsuario', function ($state,UserService, PedidoService,PedidoTemporalService) {

    var self = this;

    self.usuario = UserService.usuarioLogueado();


    self.nombre = "";
    self.email = "";
    self.direccion = "";

    self.pedidosAnteriores = [];
    self.obtenerPedidos = function(){

        PedidoService.obtenerPedidosAnterioresDe(self.usuario.nick)
            .then(function (data) {
                self.pedidosAnteriores = data;
            })
            .catch(console.log("un error :D "))
    };

    self.obtenerPedidos();


    self.repetirPedido = function (pedido) {
        /*ir a la ventana confirmacionPedido*/
        PedidoTemporalService.pedido = pedido;
        $state('confirmar');

    };

    self.setearCambios = function (){

        let jsonUsuario = {
            "nick": self.usuario.nick,
            "nombre":self.nombre,
            "email":self.email,
            "direccion":self.direccion
        };

        UserService.modificarUsuario(jsonUsuario);

    };

});
