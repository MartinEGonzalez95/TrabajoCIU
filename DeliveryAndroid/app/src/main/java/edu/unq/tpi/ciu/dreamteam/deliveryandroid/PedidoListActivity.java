package edu.unq.tpi.ciu.dreamteam.deliveryandroid;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;


import edu.unq.tpi.ciu.dreamteam.deliveryandroid.domain.Pedido;
import edu.unq.tpi.ciu.dreamteam.deliveryandroid.services.PedidoService;
import retrofit.Call;
import retrofit.Callback;
import retrofit.GsonConverterFactory;
import retrofit.Response;
import retrofit.Retrofit;

import java.util.ArrayList;
import java.util.List;


public class PedidoListActivity extends AppCompatActivity {


    private boolean modoTablet;
    List<Pedido> pedidos = new ArrayList<>();
    private PedidoService service;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_pedido_list);
        setUpToolbar();

        setUpFloatingButton();

        setModoTableta();


        final String BASE_URL = "http://192.168.1.39:9100";

        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl(BASE_URL)
                .addConverterFactory(GsonConverterFactory.create())
                .build();
        service = retrofit.create(PedidoService.class);

        obtenerPedidosAPI(service);

        setUpReciclerView();
    }

    private void obtenerPedidosAPI(PedidoService service) {
        Call<List<Pedido>> call = service.pedidosPorEstado("Preparando");

        call.enqueue(new Callback<List<Pedido>>() {
            @Override
            public void onResponse(Response<List<Pedido>> response, Retrofit retrofit) {
                pedidos = response.body();

                //Toast.makeText(PedidoListActivity.this, response.message(), Toast.LENGTH_LONG).show();
                setTitle("Pedidos");
            }

            @Override
            public void onFailure(Throwable t) {
                Log.e("HelloWorld", t.getMessage());
                Toast.makeText(PedidoListActivity.this, "Ha ocurrido un error al llamar al servicio", Toast.LENGTH_LONG).show();
            }
        });
    }

    private void setUpFloatingButton() {
        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {


            @Override
            public void onClick(View view) {
                obtenerPedidosAPI(service);
                Snackbar.make(view, "Recargando pedidos", Snackbar.LENGTH_LONG)
                        .setAction("Action", null).show();
            }
        });
    }

    private void setUpToolbar() {
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        toolbar.setTitle(getTitle());
    }

    private void setUpReciclerView() {
        View recyclerView = findViewById(R.id.pedido_list);
        assert recyclerView != null;
        this.setupRecyclerView((RecyclerView) recyclerView);
    }

    private void setModoTableta() {

        // The detail container view will be present only in the
        // large-screen layouts (res/values-w900dp).
        // If this view is present, then the
        // activity should be in two-pane mode.
        modoTablet = findViewById(R.id.pedido_detail_container) != null;
    }

    private void setupRecyclerView(@NonNull RecyclerView recyclerView) {

        recyclerView.setAdapter(new SimplePedidoRecyclerViewAdapter(this, this.obtenerPedidos(), modoTablet));
    }

    private List<Pedido> obtenerPedidos() {

        return this.pedidos;
    }

    public static class SimplePedidoRecyclerViewAdapter
            extends RecyclerView.Adapter<SimplePedidoRecyclerViewAdapter.ViewHolder> {


        SimplePedidoRecyclerViewAdapter(PedidoListActivity parent,
                                        List<Pedido> pedidos,
                                        boolean modoTablet) {
            this.pedidos = pedidos;
            this.mParentActivity = parent;
            this.modoTablet = modoTablet;
        }

        private final PedidoListActivity mParentActivity;
        private final List<Pedido> pedidos;
        private final boolean modoTablet;

        private final View.OnClickListener mOnClickListener = new View.OnClickListener() {

            @Override
            public void onClick(View view) {

                Pedido unPedido = (Pedido) view.getTag();

                if (modoTablet) {
                    Bundle arguments = new Bundle();
                    arguments.putString(PedidoDetailFragment.PEDIDO_ID, unPedido.getCliente());

                    PedidoDetailFragment fragment = new PedidoDetailFragment();
                    fragment.setArguments(arguments);
                    mParentActivity.getSupportFragmentManager().beginTransaction()
                            .replace(R.id.pedido_detail_container, fragment)
                            .commit();
                } else {
                    Context context = view.getContext();
                    Intent intent = new Intent(context, PedidoDetailActivity.class);

                    intent.putExtra(PedidoDetailFragment.PEDIDO_ID, unPedido.getNumero());

                    context.startActivity(intent);
                }
            }
        };


        @Override
        public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
            View view = LayoutInflater.from(parent.getContext())
                    .inflate(R.layout.pedido_list_content, parent, false);
            return new ViewHolder(view);
        }

        @Override
        public void onBindViewHolder(final ViewHolder holder, int position) {
            holder.pedidoIDNumero.setText(pedidos.get(position).getCliente());
            holder.clienteNombrePedido.setText(pedidos.get(position).getEstadoDePedido().getNombre());

            holder.itemView.setTag(pedidos.get(position));
            holder.itemView.setOnClickListener(mOnClickListener);
        }

        @Override
        public int getItemCount() {
            return this.pedidos.size();
        }

        class ViewHolder extends RecyclerView.ViewHolder {
            final TextView pedidoIDNumero;
            final TextView clienteNombrePedido;

            ViewHolder(View view) {
                super(view);
                pedidoIDNumero = (TextView) view.findViewById(R.id.id_pedido);
                clienteNombrePedido = (TextView) view.findViewById(R.id.cliente_nick);
            }
        }
    }
}
