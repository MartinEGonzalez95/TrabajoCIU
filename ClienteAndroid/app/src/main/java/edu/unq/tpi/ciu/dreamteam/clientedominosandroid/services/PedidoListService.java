package edu.unq.tpi.ciu.dreamteam.clientedominosandroid.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import edu.unq.tpi.ciu.dreamteam.clientedominosandroid.domain.Pedido;

public class PedidoListService {
    public static List<Pedido> pedidos = new ArrayList<>();

    public static Map<Integer, Pedido> pedidoMap = new HashMap<>();

    private static int count = 0;

    public static void addAll(List<Pedido> pedidos) {

        for (Pedido pedido : pedidos) {
            addItem(pedido);
        }
    }

    private static void addItem(Pedido pedido) {
        pedidos.add(pedido);
        pedidoMap.put(Integer.valueOf(pedido.getNumero()), pedido);
    }

//    private static Pedido createDummyPedido(int position) {
//        return new Pedido("cliente: " + String.valueOf(position) + " ", "EnViaje ", position);
//    }

    public static void clear() {
        //count++;
        pedidos.clear();
        pedidoMap.clear();
        //addItem(createDummyPedido(count));

    }
}