package edu.unq.tpi.ciu.dreamteam.clientedominosandroid;

import android.app.Activity;
import android.os.Bundle;
import android.support.design.widget.CollapsingToolbarLayout;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import edu.unq.tpi.ciu.dreamteam.clientedominosandroid.R;

import edu.unq.tpi.ciu.dreamteam.clientedominosandroid.domain.Pedido;
import edu.unq.tpi.ciu.dreamteam.clientedominosandroid.services.PedidoListService;


public class PedidoDetailFragment extends Fragment {

    public static String PEDIDO_ID = "pedidos_id";

    private Pedido pedido;

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
        return rootView;
    }


    private void mostrarPedido(View view) {
        String direccion = pedido.getDireccion();
        ((TextView) view.findViewById(R.id.pedido_direccion)).setText(direccion);

        String estado = pedido.getEstadoDePedido().getNombre();
        ((TextView) view.findViewById(R.id.pedido_state)).setText(estado);

        String monto = (Double.toString(pedido.montoFinal()));
        ((TextView) view.findViewById(R.id.pedido_monto)).setText("$ " + monto);


    }

}
