/** Controlador del usuario */

dominosApp.controller('controllerCliente', function (loginService) {
    this.usuarioLogueado = loginService.getUsuarioLogueado ;
    this.estaLogueado = loginService.yaSeLogueo;
    //this.nick = "Pepito";


});