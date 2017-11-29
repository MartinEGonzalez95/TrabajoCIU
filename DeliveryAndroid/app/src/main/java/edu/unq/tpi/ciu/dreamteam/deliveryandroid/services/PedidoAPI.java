package edu.unq.tpi.ciu.dreamteam.deliveryandroid.services;

import java.util.List;

import edu.unq.tpi.ciu.dreamteam.deliveryandroid.domain.EstadoDTO;
import edu.unq.tpi.ciu.dreamteam.deliveryandroid.domain.Pedido;
import retrofit.Call;
import retrofit.http.Body;
import retrofit.http.GET;
import retrofit.http.PUT;
import retrofit.http.Path;


public interface PedidoAPI {

    @GET("/pedidos/delivery")
    Call<List<Pedido>> getPedidosParaDelivery();

    @GET("/pedidos/{numero}")
    Call<Pedido> pedidoPorNumero(@Path("numero") int numero);

    @PUT("/pedidos/{numero}/estado")
    Call<EstadoDTO> cambiarEstado(@Path("numero") int numero, @Body EstadoDTO unNuevoEstado);

}
