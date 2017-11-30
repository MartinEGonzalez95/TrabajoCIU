package edu.unq.tpi.ciu.dreamteam.deliveryandroid.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import edu.unq.tpi.ciu.dreamteam.deliveryandroid.domain.Plato;

/**
 * Created by franc on 29/11/2017.
 */

public class PlatoListService {

    public static List<Plato> platos = new ArrayList<>();

    public static Map<Integer, Plato> platoMap = new HashMap<>();

    private static int count = 0;

    public static void addAll(List<Plato> platos) {

        for (Plato plato : platos) {
            addItem(plato);
        }
    }

    private static void addItem(Plato plato) {
        platos.add(plato);
        //platoMap.put(plato., plato);
    }

    public static void clear() {

        platos.clear();
        platoMap.clear();

    }

}
