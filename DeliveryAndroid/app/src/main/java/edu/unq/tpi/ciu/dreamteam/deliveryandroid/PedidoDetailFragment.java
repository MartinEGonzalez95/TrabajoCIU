package edu.unq.tpi.ciu.dreamteam.deliveryandroid;

import android.app.Activity;
import android.support.design.widget.CollapsingToolbarLayout;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import edu.unq.tpi.ciu.dreamteam.deliveryandroid.domain.Pedido;
import edu.unq.tpi.ciu.dreamteam.deliveryandroid.services.PedidoListService;


/**
 * A fragment representing a single Pedido detail screen.
 * This fragment is either contained in a {@link PedidoListActivity}
 * in two-pane mode (on tablets) or a {@link PedidoDetailActivity}
 * on handsets.
 */
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

        // Show the dummy content as text in a TextView.
        if (pedido != null) {
            String estado = pedido.getEstadoDePedido().getNombre();
            ((TextView) rootView.findViewById(R.id.pedido_detail)).setText(estado);
        }

        return rootView;
    }
}
