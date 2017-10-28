dominosApp.controller('controllerLoginReg', function(loginService) {
	this.nick;
	this.pass;

	this.loguear = function() {
		loginService.logearUsuario({nick: this.nick, pass: this.pass});
	}
});