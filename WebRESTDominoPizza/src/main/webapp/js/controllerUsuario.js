dominosApp.controller('ControllerUsuario', function ($state,UserService, PedidoService,PedidoTemporalService, ExceptionService) {

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
            .catch(errorHandler)
    };

    this.obtenerPedidos();

    this.repetirPedido = function (pedido) {
        /*ir a la ventana confirmacionPedido*/
        PedidoTemporalService.pedido = pedido;
        $state.go('confirmar');

    };

    this.setearCambios = function () {

        let jsonUsuario = {
            "nick": self.usuario.nick,
            "nombre": self.nombre,
            "email": self.email,
            "direccion": self.direccion
        };

        this.usuario = UserService.modificarUsuario(jsonUsuario)

    };

    this.direccionDelPedido = function(pedido){
        if(pedido.formaDeEnvio.nombre === "Delivery"){
            return pedido.formaDeEnvio.direccion
        }else{
            return ""
        }
    };

    function errorHandler(error) {
        ExceptionService.capturarError(error);
    }

    this.excepciones = ExceptionService.errores;

});