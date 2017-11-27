package edu.unq.tpi.ciu.dreamteam.clientedominosandroid.services;

import java.util.List;

import edu.unq.tpi.ciu.dreamteam.clientedominosandroid.domain.Pedido;
import edu.unq.tpi.ciu.dreamteam.clientedominosandroid.domain.Usuario;
import edu.unq.tpi.ciu.dreamteam.clientedominosandroid.services.LoginBody;
import retrofit.Call;
import retrofit.http.Body;
import retrofit.http.GET;
import retrofit.http.POST;
import retrofit.http.PUT;
import retrofit.http.Path;
import retrofit.http.Query;


public interface PedidoAPI {
    @POST("/login")
    Call<Usuario> login(@Body LoginBody post);

    @GET("/pedidos")
    Call<List<Pedido>> pedidos(@Query("nick") String nick);

    @PUT("/usuarios/{nick}")
    Call<Usuario> modificarUsuario(@Path("nick") String nick, @Body Usuario post);
}
