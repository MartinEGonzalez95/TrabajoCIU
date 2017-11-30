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
import android.view.View;
import android.widget.Toast;


import edu.unq.tpi.ciu.dreamteam.deliveryandroid.android.AdapterForPedidoRow;
import edu.unq.tpi.ciu.dreamteam.deliveryandroid.domain.Pedido;
import edu.unq.tpi.ciu.dreamteam.deliveryandroid.services.PedidoListService;
import edu.unq.tpi.ciu.dreamteam.deliveryandroid.services.PedidoAPI;
import edu.unq.tpi.ciu.dreamteam.deliveryandroid.services.ServiceProvider;
import retrofit.Call;
import retrofit.Callback;
import retrofit.Response;
import retrofit.Retrofit;

import java.util.List;


public class PedidoListActivity extends AppCompatActivity {

    private boolean modoTablet;

    private PedidoAPI service;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_pedido_list);
        setUpToolbar();

        botonFlotanteRecargarPedidos();

        setModoTableta();

        //TODO REFACTOR CONSTANT
        service = ServiceProvider.getInstance().getService();
        obtenerPedidosAPI(service);

    }

    @Override
    public void onResume()
    {
        super.onResume();

        //TODO REFACTOR CONSTANT
        service = ServiceProvider.getInstance().getService();
        obtenerPedidosAPI(service);
    }

    private void obtenerPedidosAPI(PedidoAPI service) {

        Call<List<Pedido>> call = service.getPedidosParaDelivery();

        call.enqueue(new Callback<List<Pedido>>() {
            @Override
            public void onResponse(Response<List<Pedido>> response, Retrofit retrofit) {

                PedidoListService.clear();
                PedidoListService.addAll(response.body());
                setUpReciclerView();
                setTitle("Pedidos");
            }

            @Override
            public void onFailure(Throwable t) {
                Log.e("HelloWorld", t.getMessage());
                Toast.makeText(PedidoListActivity.this, "Ha ocurrido un error al llamar al servicio", Toast.LENGTH_LONG).show();
            }
        });
    }

    private void botonFlotanteRecargarPedidos() {
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

        this.setupRecyclerView((RecyclerView) recyclerView);
    }

    private void setModoTableta() {

        modoTablet = findViewById(R.id.pedido_detail_container) != null;
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
                    .replace(R.id.pedido_detail_container, fragment)
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
