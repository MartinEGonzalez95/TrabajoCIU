/** Este service le va a pegar al servidor para:
 * Buscar un usuario
 * Modificar un usuario
 *
 * */

angular.module('dominosApp').service("UserService", function () {

    this.usuarios = [];

    this.crearUsuario = function (description) {
        let cliente = new Cliente(description);
        this.agregarCliente(cliente);
        return cliente;
    };

    this.agregarCliente = function (cliente) {
        this.usuarios.push(cliente);
    };

    this.buscarUsuario = function (nick) {
        return _.find(this.usuarios, user => user.nick === nick)
    };

});

let Cliente = function (nick) {

    this.nick = nick;

};

