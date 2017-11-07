/** Este service le va a pegar al servidor para:
 * Buscar un usuario
 * Modificar un usuario
 * */

angular.module('dominosApp').service("UserService", function ($http) {

    this.usuario;

    let getData = function (response) {
        return response.data
    };
    let parsearUsuario = function (json) {
        this.usuario =  new Cliente(json);

        return this.usuario
    };

    return {
        obtenerUsuario: function (nick) {
            return $http.get("usuarios/"+ nick)
                .then(getData)
                .then(parsearUsuario)

        },
        modificarUsuario:function (usuario) {
            return $http.put("usuarios/"+usuario.nick, usuario)
        }
    }
});

