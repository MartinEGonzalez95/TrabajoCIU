angular.module('dominosApp').controller('ControllerUsuario', function () {

    this.nombre = "juan";
    this.nick = "JuanK-po";
    this.email = "juanemail@email.com";
    this.direccion = "una calle";

    this.pedidosAnteriores = [
        {
            "pizza": "Muzarella",
            "direccion": "calle123",
            "monto": "123"
        },
        {
            "pizza": "Tomaco",
            "direccion": "calle321",
            "monto": "321"
        }
        ];

    linkAPaginaDeConfirmacion = function (pedido) {
        /*ir a la ventana confirmacionPedido*/
        window.open("menu_confirmar.html");
    };

    setearCambios = function (){
        /*post con el servidor rest*/
    };

});
