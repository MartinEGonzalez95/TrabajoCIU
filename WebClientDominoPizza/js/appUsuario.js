'use strict';

let app = angular.module('usuarioApp', []);

app.controller('UsuarioCtrl', function () {

    this.nombre = "juan";
    this.nick = "jon";
    this.email = "juanemail@email.com";
    this.direccion = "una calle";

    this.pedidosAnteriores = [
        {
            "pizza": "Muzarella",
            "direccion": "calle123",
            "monto": "123"
        }
        ];

});

linkAPaginaDeConfirmacion = function (pedido) {
    window.open("confirmacionPedido.html");

};