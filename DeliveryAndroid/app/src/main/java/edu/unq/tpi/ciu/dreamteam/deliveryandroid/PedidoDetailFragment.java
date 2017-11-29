package edu.unq.tpi.ciu.dreamteam.deliveryandroid;

import android.app.Activity;
import android.support.design.widget.CollapsingToolbarLayout;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import edu.unq.tpi.ciu.dreamteam.deliveryandroid.domain.EstadoDTO;
import edu.unq.tpi.ciu.dreamteam.deliveryandroid.domain.Pedido;
import edu.unq.tpi.ciu.dreamteam.deliveryandroid.services.PedidoAPI;
import edu.unq.tpi.ciu.dreamteam.deliveryandroid.services.PedidoListService;
import edu.unq.tpi.ciu.dreamteam.deliveryandroid.services.ServiceProvider;
import retrofit.Call;
import retrofit.Callback;
import retrofit.Response;
import retrofit.Retrofit;


/**
 * A fragment representing a single Pedido detail screen.
 * This fragment is either contained in a {@link PedidoListActivity}
 * in two-pane mode (on tablets) or a {@link PedidoDetailActivity}
 * on handsets.
 */
public class PedidoDetailFragment extends Fragment {

    public static String PEDIDO_ID = "pedidos_id";

    private Pedido pedido;
    private PedidoAPI pedidoAPI = ServiceProvider.getInstance().getService();

    public PedidoDetailFragment() {
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        if (getArguments().containsKey(PEDIDO_ID)) {
            int miID = Integer.parseInt(getArguments().get(PEDIDO_ID).toString());
            pedido = PedidoListService.pedidoMap.get(miID);

            Activity activity = this.getActivity();
            CollapsingToolbarLayout appBarLayout = (CollapsingToolbarLayout) activity.findViewById(R.id.toolbar_layout);
            if (appBarLayout != null) {
                appBarLayout.setTitle(pedido.getCliente());
            }
        }
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.pedido_detail, container, false);

        this.mostrarPedido(rootView);
        this.crearBotones(rootView);
        return rootView;
    }

    private void crearBotones(View rootView) {


        final Button avanzar = rootView.findViewById(R.id.button_avanzar);
        final Button cancelar = rootView.findViewById(R.id.button_cancelar);

        this.setButtonOnClickListener(avanzar, pedido.getEstadoDePedido());
        this.setButtonOnClickListener(cancelar, new EstadoDTO("Cerrado"));

    }

    private void setButtonOnClickListener(Button unBoton, final EstadoDTO unEstadoParaCambiar) {
        unBoton.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                Call<EstadoDTO> call = pedidoAPI.cambiarEstado(pedido.getNumero(), unEstadoParaCambiar);
                realizarCambioDeEstado(call);
                volverAlInicio();
            }

        });
    }

    private void realizarCambioDeEstado(Call<EstadoDTO> call) {
        call.enqueue(new Callback<EstadoDTO>() {
            @Override
            public void onResponse(Response<EstadoDTO> response, Retrofit retrofit) {

                Toast.makeText(getActivity(), "Cambiando estado", Toast.LENGTH_LONG).show();
            }

            @Override
            public void onFailure(Throwable t) {
                Log.e("Cliente-Dominos", t.getMessage());
                Toast.makeText(getActivity(), "Ha ocurrido un error al llamar al servicio", Toast.LENGTH_LONG).show();
            }
        });
    }

    private void volverAlInicio() {

    }

    private void mostrarPedido(View view) {
        String direccion = pedido.getDireccion();
        ((TextView) view.findViewById(R.id.pedido_direccion)).setText(direccion);

        String estado = pedido.getEstadoDePedido().getNombre();
        ((TextView) view.findViewById(R.id.pedido_state)).setText(estado);

        String monto = (Double.toString(pedido.montoFinal()));
        ((TextView) view.findViewById(R.id.pedido_monto)).setText("$ " + monto);


    }

    public void cancelarPedido(View view) {
//        getSupportFragmentManager().beginTransaction()
//                .replace(R.id.libro_detail_container, fragment)
//                .commit();

    }
}
