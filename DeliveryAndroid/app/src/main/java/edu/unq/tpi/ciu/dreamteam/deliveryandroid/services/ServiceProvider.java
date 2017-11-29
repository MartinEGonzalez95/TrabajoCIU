package edu.unq.tpi.ciu.dreamteam.deliveryandroid.services;


import retrofit.GsonConverterFactory;
import retrofit.Retrofit;

public class ServiceProvider {
    private static ServiceProvider service = null;
    private ServiceProvider() {

    }

    //HARDCODED url
    final String BASE_URL = "http://192.168.0.8:9100";

    public PedidoAPI getService() {

        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl(BASE_URL)
                .addConverterFactory(GsonConverterFactory.create())
                .build();
        return retrofit.create(PedidoAPI.class);
    }

    public static ServiceProvider getInstance() {
        if(service == null ) {
            service = new ServiceProvider();
        }
        return service;
    }



}
