angular.module('dominosApp').controller("controllerPlato", function ($state, MenuService, PedidoTemporalService, PlatoService) {
    
        const self = this;

        this.plato = PlatoService.plato;

        this.ingredientes = PlatoService.plato.pizza.ingredientes;

        this.ingredientesExtras = []

        this.obtenerIngredientes = function(){

            MenuService.obtenerIngredientes()
                .then(function(data){
                    
                    self.ingredientesExtras = data;
    
                })
               // .catch(errorHandler);
        }

        this.obtenerIngredientes();

        function errorHandler(error) {
            console.log(error);
            ExceptionService.capturarError(error);
        }

        this.agregar = function(unIngrediente) { this.plato.ingredientesExtras.push(unIngrediente) };
        this.quitar = function(unIngrediente)
        {
            var index = this.plato.ingredientesExtras.indexOf(unIngrediente);
            if (index > -1)
            {
                this.plato.ingredientesExtras.splice(index, 1);
            } 

        };

    this.confirmarme = function() {
        PedidoTemporalService.agregarPlato(this.plato);
        $state.go("confirmar")
    }

});