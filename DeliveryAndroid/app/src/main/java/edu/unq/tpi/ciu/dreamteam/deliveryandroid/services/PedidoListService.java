package edu.unq.tpi.ciu.dreamteam.deliveryandroid.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import edu.unq.tpi.ciu.dreamteam.deliveryandroid.domain.Pedido;

/**
 * Created by Gunnark on 22/11/2017.
 */

public class PedidoListService {


    /**
     * An array of sample (dummy) items.
     */
    public static final List<Pedido> PEDIDOS = new ArrayList<>();

    /**
     * A map of sample (dummy) items, by ID.
     */
    public static final Map<Integer, Pedido> PEDIDO_MAP = new HashMap<>();

    private static final int COUNT = 15;

    static {
        // Add some sample items.
        for (int i = 1; i <= COUNT; i++) {
            addItem(createDummyPedido(i));
        }
    }

    private static void addItem(Pedido pedido) {
        PEDIDOS.add(pedido);
        PEDIDO_MAP.put(pedido.getNumero(), pedido);
    }

    private static Pedido createDummyPedido(int position) {
        return new Pedido("cliente: " + String.valueOf(position) + " ", "EnViaje " + position, position);
    }


}
