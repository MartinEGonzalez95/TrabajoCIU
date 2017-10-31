angular.module('dominosApp').controller("controllerPlato", function (MenuService) {
    
        //this.pizza = PlatoService.plato;
        //this.ingredientes = PlatoService.ingredientes
        //this.ingredientesExtras = MenuService.ingredientes

        this.plato = { "pizza": {

            "nombre": "Muzarella",
            "precio": 100,
            "ingredientes": [
                {
                    "nombre": "Muzarella",
                    "distribucion": "Todo"
                },
                {
                    "nombre": "Oregano",
                    "distribucion": "Todo"
                }]
            },
            "tamanio": {
                "nombre":"Grande",
                "valor": 1
            },
            "ingredientesExtras": []
        };

        this.ingredientesExtras = { "ingredientes": [
            {
                "nombre": "Jamón",
                "distribucion": "Todo",
                "precio": 12
            },
            {
                "nombre": "Morrones",
                "distribucion": "Todo",
                "precio": 10
            },
            {
                "nombre": "Anchoas",
                "distribucion": "Todo",
                "precio": 7
            },
            {
                "nombre": "Papitas",
                "distribucion": "Todo",
                "precio": 5
            }
        
        ]};

        this.agregar = function(unIngrediente) { this.plato.ingredientesExtras.push(unIngrediente) };
        this.quitar = function(unIngrediente) { 
            var index = this.plato.ingredientesExtras.indexOf(unIngrediente);
            if (index > -1) {
                this.plato.ingredientesExtras.splice(index, 1);
            } };

});