dominosApp.controller('controllerLoginReg', function ($state, loginService) {
	var self = this;
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
		self.estaLogueado = loginService.yaSeLogueo();
		self.usuarioLogueado = loginService.getUsuarioLogueado();
		self.login = !self.estaLogueado && !self.registro;
	}
	self.userUpdate();

	self.loguear = function () {
		loginService.logearUsuario({ nick: self.nick, pass: self.pass });
		self.userUpdate();
		$state.go('menu');
	}

	self.toogleRegistrar = function () {
		self.registro = self.registro ? false : true;
		self.userUpdate();
	};

	self.registrar = function () {

		if (self.reg.pass !== null && self.reg.pass === self.reg.passrep) {
			loginService.registrarUsuario({
				nick: self.reg.nick,
				pass: self.reg.pass,
				nombre: self.reg.nombre,
				mail: self.reg.mail,
				direccion: self.reg.direccion
			});
			self.toogleRegistrar();
		} else {
			alert('Las contrasenas no coinciden o son nulas');
		}
		self.userUpdate();
		if (self.estaLogueado) {
			$state.go('menu');
		}
	}
});