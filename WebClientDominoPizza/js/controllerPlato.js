angular.module('dominosApp').controller("controllerPlato", function (MenuService) {
    
        //this.pizza = PlatoService.plato;
        //this.ingredientes = PlatoService.ingredientes
        //this.ingredientesExtras = MenuService.ingredientes

        this.plato = { "pizza": {

            "nombre": "Muzarella",
            "precio": 100,
            "ingredientes": [
                {
                    "nombre": "Muzarella"
                }]
            },
            "tamanio": {
                "nombre":"Grande",
                "valor": 1
            },
            "ingredientesExtras": []
        }

        this.ingredientesExtras = { "ingredientes": [
            {
                "nombre": "Jamón"
            },
            {
                "nombre": "Morrones"
            },
            {
                "nombre": "Anchoas"
            },
            {
                "nombre": "Papitas"
            }
        
        ]}

});