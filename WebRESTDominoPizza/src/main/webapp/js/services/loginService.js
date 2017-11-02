dominosApp.service('loginService', function () {
	var logService = {};

	logService.usuarioLogueado = null;

	logService.yaSeLogueo = function () {
		return logService.usuarioLogueado !== null;
    };

	logService.logearUsuario = function (usuario) {
		logService.usuarioLogueado = usuario;
    };

	logService.getUsuarioLogueado = function () {
		return logService.usuarioLogueado;

    };

	logService.registrarUsuario = function (usuario) {
		//hacerllamado a api y en respuesta correcta loguear usuario creado
		logService.usuarioLogueado = usuario;
    };
	return logService;
});