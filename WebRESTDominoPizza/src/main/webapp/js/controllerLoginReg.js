dominosApp.controller('controllerLoginReg', function ($state, ExceptionService, UserService) {
	var self = this;
	var errors = ExceptionService;

	self.reg = {
		nick: null,
		pass: null,
		passresp: null,
		nombre: null,
		mail: null,
		direccion: null
	};
	self.estaLogueado = false;
	self.usuarioLogueado = false;
	self.registro = false;
	self.login = false;

	self.nick;
	self.pass;


	self.userUpdate = function () {
		self.estaLogueado = UserService.yaSeLogueo();
		self.usuarioLogueado = UserService.usuarioLogueado();
		self.login = !self.estaLogueado && !self.registro;
	}

	self.userUpdate();

	self.loguear = function () {
		UserService.logearUsuario({ nick: self.nick, password: self.pass })
			.then(function (resp) {
				self.userUpdate();
				$state.go('menu');
			})
			.catch(function (error) {
				errors.capturarError(error);
			})
	}

	self.toogleRegistrar = function () {
        $state.go('registrar');
	};

	self.registrar = function () {
		if (self.reg.pass !== null && self.reg.pass === self.reg.passrep) {
			UserService.registrarUsuario({
				nick: self.reg.nick,
				password: self.reg.pass,
				nombre: self.reg.nombre,
				email: self.reg.mail,
				direccion: self.reg.direccion
			}).then(function (data) {
				UserService.logearUsuario({ nick: self.reg.nick, password: self.reg.pass })
					.then(function (res) {
						self.toogleRegistrar();
						self.userUpdate();
						$state.go('menu');
					})
			}).catch(function (error) {
					errors.capturarError(error);
				});
		} else {
			errors.capturarError({ data: 'Las contrasenas no coinciden o son nulas' });
		}
	}
});