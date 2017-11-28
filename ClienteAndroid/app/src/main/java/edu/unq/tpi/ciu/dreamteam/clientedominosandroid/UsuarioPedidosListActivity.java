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

        if (findViewById(R.id.pedido_detail_container) != null) {
            modoTablet = true;
        }

        final LoginBody usr = new LoginBody("Fperez","1234");

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
                ImageButton imgbtn =  findViewById(R.id.editUser);
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
//                obtenerPedidosAPI(service);
//                Snackbar.make(view, "Recargando pedidos", Snackbar.LENGTH_LONG)
//                        .setAction("Action", null).show();

            if (modoTablet) {
                Bundle arguments = new Bundle();
                arguments.putString(UsuarioDetailFragment.USER_ID,  serviceUser.getUsuario().getNick());

                UsuarioDetailFragment fragment = new UsuarioDetailFragment();
                fragment.setArguments(arguments);
                getSupportFragmentManager().beginTransaction()
                        .replace(R.id.pedido_detail_container, fragment)
                        .commit();
            } else {
                Context context = view.getContext();
                Intent intent = new Intent(context, UsuarioDetailActivity.class);

                intent.putExtra(UsuarioDetailFragment.USER_ID, serviceUser.getUsuario().getNick());
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
        recyclerView.setAdapter(new SimpleItemRecyclerViewAdapter(this, this.obtenerPedidos() , modoTablet));
    }

    private List<Pedido> obtenerPedidos() {

        return PedidoListService.pedidos;
    }

    public static class SimpleItemRecyclerViewAdapter
            extends RecyclerView.Adapter<SimpleItemRecyclerViewAdapter.ViewHolder> {

        SimpleItemRecyclerViewAdapter(UsuarioPedidosListActivity parent,
                                      List<Pedido> pedidos,
                                      boolean tablet) {
            this.pedidos = pedidos;
            this.mParentActivity = parent;
            this.modoTablet = tablet;
        }

        private final UsuarioPedidosListActivity mParentActivity;
        private List<Pedido> pedidos = new ArrayList<>();
        private final boolean modoTablet;

        @Override
        public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
            View view = LayoutInflater.from(parent.getContext())
                    .inflate(R.layout.usuario_pedidos_list_content, parent, false);
            return new ViewHolder(view);
        }

        @Override
        public void onBindViewHolder(final ViewHolder holder, int position) {
            Pedido pedidoActual = pedidos.get(position);

            holder.pedidoIDNumero.setText(String.valueOf(pedidoActual.getNumero()));
            holder.clienteNombrePedido.setText(pedidoActual.getCliente());
            holder.estadoActualDePedido.setText(pedidoActual.getEstadoDePedido().getNombre());

            holder.itemView.setTag(pedidoActual);
           // holder.itemView.setOnClickListener(mOnClickListener);
        }

        @Override
        public int getItemCount() {
            return pedidos.size();
        }

        class ViewHolder extends RecyclerView.ViewHolder {
            public TextView pedidoIDNumero;
            public TextView clienteNombrePedido;
            public TextView estadoActualDePedido;

            ViewHolder(View view) {
                super(view);
                estadoActualDePedido = (TextView) view.findViewById(R.id.estadoPedido);
                pedidoIDNumero = (TextView) view.findViewById(R.id.id_pedido);
                clienteNombrePedido = (TextView) view.findViewById(R.id.cliente_nick);
            }
        }
    }
}
