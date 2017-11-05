/** Este service le va a pegar al servidor para:
 * Buscar un usuario
 * Modificar un usuario
 * */

angular.module('dominosApp').service("UserService", function ($http) {
    var self = this;
    self.usuario = null;

    let getData = function (response) {
        return response.data
    };
    let parsearUsuario = function (json) {
        self.usuario =  new Cliente(json);

        return self.usuario
    };

    return {
        obtenerUsuario: function (nick) {
            return $http.get("usuarios/"+ nick)
                .then(getData)
                .then(parsearUsuario)
        },
        modificarUsuario: function (usuario) {
            return $http.put("usuarios/"+usuario.nick, usuario)
        },
        logearUsuario: function (usuario) {
            if (!self.usuario) {
                return $http.post('/login', usuario)
                .then(function (response) {
                    parsearUsuario(response.data);
                })
		    }
        },
        yaSeLogueo: function () {
		    return self.usuario !== null;
	    },
        usuarioLogueado: function() {
            return self.usuario;
        },
        registrarUsuario: function(usuario) {
            return $http.post('/usuarios', usuario)
            .then(function(response) {
                return response;
            })
        }
    }
});

