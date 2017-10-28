dominosApp.service('loginService', function() {
	var service = {};

	service.usuarioLogueado = null;

	service.yaSeLogueo = function() {
		return service.usuarioLogueado !== null; 
	}

	service.logearUsuario = function(usuario) {
		service.usuarioLogueado = usuario;
	}

	service.getUsuarioLogueado = function() {
		return service.usuarioLogueado;
	}

	return service;
})