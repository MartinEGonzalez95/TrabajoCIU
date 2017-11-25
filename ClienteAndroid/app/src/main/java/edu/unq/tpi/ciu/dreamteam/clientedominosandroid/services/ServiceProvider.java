package edu.unq.tpi.ciu.dreamteam.clientedominosandroid.services;

import retrofit.GsonConverterFactory;
import retrofit.Retrofit;

/**
 * Created by mariano on 26/11/17.
 */

public class ServiceProvider {

    final String BASE_URL = "http://192.168.0.104:9100";

    public PedidoAPI getService() {

        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl(BASE_URL)
                .addConverterFactory(GsonConverterFactory.create())
                .build();
        return retrofit.create(PedidoAPI.class);
    }
}
