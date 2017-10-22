/** Este service le va a pegar al servidor para:
 * Buscar usuarios
 * Modificar usuarios
 * */

angular.module('dominosApp').service("UserService", function () {

    this.usuarios = [];

    this.crearUsuario = function (description) {
        var cliente = new Cliente(description);
        this.agregarCliente(cliente);
        return cliente;
    };

    this.agregarCliente = function (cliente) {
        this.usuarios.push(cliente);
    };

    this.buscarUsuario = function (nick) {
        return _.find(this.usuarios, user => user.nombre == nick)
    };

});