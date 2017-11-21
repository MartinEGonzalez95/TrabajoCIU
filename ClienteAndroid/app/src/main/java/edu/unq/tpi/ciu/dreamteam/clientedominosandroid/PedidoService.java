package edu.unq.tpi.ciu.dreamteam.clientedominosandroid;

import java.util.List;

import retrofit.Call;
import retrofit.http.Body;
import retrofit.http.GET;
import retrofit.http.POST;
import retrofit.http.Path;


public interface PedidoService {
    @POST("/login")
    Call<Usuario> login(@Body LoginBody post);

    @GET("/pedidos{nick}")
    Call<List<Pedido>> pedidos(@Path("nick") String nick);
}
