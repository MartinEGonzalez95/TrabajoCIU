package edu.unq.tpi.ciu.dreamteam.deliveryandroid.services;

import java.util.List;

import edu.unq.tpi.ciu.dreamteam.deliveryandroid.LoginBody;
import edu.unq.tpi.ciu.dreamteam.deliveryandroid.domain.Pedido;
import retrofit.Call;
import retrofit.http.Body;
import retrofit.http.GET;
import retrofit.http.POST;
import retrofit.http.PUT;
import retrofit.http.Path;
import retrofit.http.Query;


public interface PedidoService {

    @GET("/pedidos/delivery")
    Call<List<Pedido>> getPedidosParaDelivery();

    @GET("/pedidos/{numero}")
    Call<Pedido> pedidoPorNumero(@Path("numero") int numero);

    @PUT("/pedidos/{numero}/estado")
    Call<Pedido> cambiarEstado(@Path("numero") int numero, @Body String unNuevoEstado);

}
