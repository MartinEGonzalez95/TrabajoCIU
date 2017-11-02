dominosApp.controller('ControllerUsuario', function ($state,UserService, PedidosService,PedidoTemporalService) {

    const self = this;

    this.usuario = UserService.user;


    this.nombre = "";
    this.email = "";
    this.direccion = "";

    this.pedidosAnteriores = [];
    this.obtenerPedidos = function(){

        PedidosService.obtenerPedidosAnterioresDe(this.usuario.nick)
            .then(function (data) {
                self.pedidosAnteriores = data;
            })
            .catch(console.log("un error :D "))
    };

    this.obtenerPedidos();


    this.repetirPedido = function (pedido) {
        /*ir a la ventana confirmacionPedido*/
        PedidoTemporalService.pedido.pedido;
        $state('confirmar');

    };

    this.setearCambios = function (){

        let jsonUsuario = {
            "nick": this.usuario.nick,
            "nombre":this.nombre,
            "email":this.email,
            "direccion":this.direccion
        };

        UserService.modificarUsuario(jsonUsuario);

    };

});
