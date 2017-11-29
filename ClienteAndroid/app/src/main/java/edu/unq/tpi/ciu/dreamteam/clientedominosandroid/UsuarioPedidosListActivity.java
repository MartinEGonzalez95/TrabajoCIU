package edu.unq.tpi.ciu.dreamteam.clientedominosandroid;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.TextView;
import android.widget.Toast;


import edu.unq.tpi.ciu.dreamteam.clientedominosandroid.android.AdapterForPedidoRow;
import edu.unq.tpi.ciu.dreamteam.clientedominosandroid.domain.Pedido;
import edu.unq.tpi.ciu.dreamteam.clientedominosandroid.domain.Usuario;
import edu.unq.tpi.ciu.dreamteam.clientedominosandroid.services.LoginBody;
import edu.unq.tpi.ciu.dreamteam.clientedominosandroid.services.PedidoListService;
import edu.unq.tpi.ciu.dreamteam.clientedominosandroid.services.UserAPI;
import edu.unq.tpi.ciu.dreamteam.clientedominosandroid.services.ServiceProvider;
import edu.unq.tpi.ciu.dreamteam.clientedominosandroid.services.UserService;
import retrofit.Call;
import retrofit.Callback;
import retrofit.Response;
import retrofit.Retrofit;

import java.util.ArrayList;
import java.util.List;

public class UsuarioPedidosListActivity extends AppCompatActivity {

    private boolean modoTablet;

    private UserAPI service;
    private UserService serviceUser = UserService.getInstance();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_usuario_pedidos_list);

        setUpToolbar();

        botonEditarUsuario();

        if (findViewById(R.id.usuario_detail_container) != null) {
            modoTablet = true;
        }

        final LoginBody usr = new LoginBody("Fperez", "1234");

        service = ServiceProvider.getInstance().getService();

        obtenerUsuarioAPI(usr);
    }

    private void obtenerUsuarioAPI(LoginBody usr) {
        Call<Usuario> call = service.login(usr);

        call.enqueue(new Callback<Usuario>() {
            @Override
            public void onResponse(Response<Usuario> response, Retrofit retrofit) {

                serviceUser.loguearUsuario(response.body());
                setTitle(serviceUser.getUsuario().getNick());
                ImageButton imgbtn = findViewById(R.id.editUser);
                imgbtn.setEnabled(true);
                obtenerPedidosAPI(serviceUser.getUsuario().getNick());
            }

            @Override
            public void onFailure(Throwable t) {
                Log.e("CLiente-Dominos", t.getMessage());
                Toast.makeText(UsuarioPedidosListActivity.this, "Ha ocurrido un error al llamar al servicio", Toast.LENGTH_LONG).show();
            }
        });
    }

    private void obtenerPedidosAPI(String nick) {
        Call<List<Pedido>> call2 = service.pedidos(nick);

        call2.enqueue(new Callback<List<Pedido>>() {
            @Override
            public void onResponse(Response<List<Pedido>> response, Retrofit retrofit) {

                if (response.body() != null) {
                    PedidoListService.clear();
                    PedidoListService.addAll(response.body());
                    setUpRecView();
                }
            }

            @Override
            public void onFailure(Throwable t) {
                Log.e("HelloWorld", t.getMessage());
                Toast.makeText(UsuarioPedidosListActivity.this, "Ha ocurrido un error al llamar al servicio", Toast.LENGTH_LONG).show();
            }
        });
    }

    private void botonEditarUsuario() {
        ImageButton imgbtn = (ImageButton) findViewById(R.id.editUser);
        imgbtn.setEnabled(false);
        imgbtn.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View view) {
                if (modoTablet) {

                    UsuarioDetailFragment fragment = new UsuarioDetailFragment();
                    getSupportFragmentManager().beginTransaction()
                            .replace(R.id.usuario_detail_container, fragment)
                            .commit();
                } else {
                    Context context = view.getContext();
                    Intent intent = new Intent(context, UsuarioDetailActivity.class);

                    System.out.println(intent.getDataString());
                    context.startActivity(intent);
                }
            }
        });

    }

    private void setUpToolbar() {
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        toolbar.setTitle(getTitle());
    }

    private void setUpRecView() {
        View recyclerView = findViewById(R.id.pedido_list);
        assert recyclerView != null;
        this.setupRecyclerView((RecyclerView) recyclerView);
    }

    private void setupRecyclerView(@NonNull RecyclerView recyclerView) {
        recyclerView.setAdapter(new AdapterForPedidoRow(this, this.obtenerPedidos()));
    }

    private List<Pedido> obtenerPedidos() {

        return PedidoListService.pedidos;
    }

    public void irAlFragmentDetalleDePedido(Pedido unPedido, View view) {

        if (modoTablet) {
            Bundle arguments = new Bundle();
            arguments.putString(PedidoDetailFragment.PEDIDO_ID, Integer.toString(unPedido.getNumero()));

            PedidoDetailFragment fragment = new PedidoDetailFragment();
            fragment.setArguments(arguments);
            this.getSupportFragmentManager().beginTransaction()
                    .replace(R.id.pedido_list, fragment)
                    .commit();
        } else {
            Context context = view.getContext();
            Intent intent = new Intent(context, PedidoDetailActivity.class);

            intent.putExtra(PedidoDetailFragment.PEDIDO_ID, Integer.toString(unPedido.getNumero()));
            System.out.println(intent.getDataString());
            context.startActivity(intent);
        }
    }


}
