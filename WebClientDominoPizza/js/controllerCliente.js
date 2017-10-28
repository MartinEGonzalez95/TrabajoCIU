/** Controlador del usuario */

dominosApp.controller('controllerCliente', function (loginService) {
    var self = this;

    self.estaLogueado = loginService.yaSeLogueo;
    self.usuarioLogueado = loginService.getUsuarioLogueado;

});