package edu.unq.tpi.ciu.dreamteam.clientedominosandroid;

import android.app.Activity;
import android.support.design.widget.CollapsingToolbarLayout;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import edu.unq.tpi.ciu.dreamteam.clientedominosandroid.domain.Usuario;
import edu.unq.tpi.ciu.dreamteam.clientedominosandroid.services.LoginBody;
import edu.unq.tpi.ciu.dreamteam.clientedominosandroid.services.PedidoAPI;
import edu.unq.tpi.ciu.dreamteam.clientedominosandroid.services.ServiceProvider;
import retrofit.Call;
import retrofit.Callback;
import retrofit.Response;
import retrofit.Retrofit;

/**
 * A fragment representing a single Pedido detail screen.
 * This fragment is either contained in a {@link UsuarioPedidosListActivity}
 * in two-pane mode (on tablets) or a {@link UsuarioDetailActivity}
 * on handsets.
 */
public class UsuarioDetailFragment extends Fragment {
    /**
     * The fragment argument representing the item ID that this fragment
     * represents.
     */
    public static final String USER_ID = "nick";

    private String mItem;

    private Usuario usrLogueado;

    private PedidoAPI service;
    /**
     * Mandatory empty constructor for the fragment manager to instantiate the
     * fragment (e.g. upon screen orientation changes).
     */
    public UsuarioDetailFragment() {
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        service = new ServiceProvider().getService();

        if (getArguments().containsKey(USER_ID)) {
            mItem = getArguments().getString(USER_ID);
            final LoginBody usr = new LoginBody("Fperez","1234");

            obtenerUsuarioAPI(usr);

            Activity activity = this.getActivity();
            CollapsingToolbarLayout appBarLayout = (CollapsingToolbarLayout) activity.findViewById(R.id.toolbar_layout);
            if (appBarLayout != null) {
                appBarLayout.setTitle(mItem);
            }
        }
    }

    private void obtenerUsuarioAPI(LoginBody usr) {
        Call<Usuario> call = service.login(usr);

        call.enqueue(new Callback<Usuario>() {
            @Override
            public void onResponse(Response<Usuario> response, Retrofit retrofit) {
                usrLogueado = response.body();
            }

            @Override
            public void onFailure(Throwable t) {
                Log.e("CLiente-Dominos", t.getMessage());
                Toast.makeText(getActivity(), "Ha ocurrido un error al llamar al servicio", Toast.LENGTH_LONG).show();
            }
        });
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.usuario_detail, container, false);

        // Show the dummy content as text in a TextView.
        if (mItem != null) {
            ((TextView) rootView.findViewById(R.id.pedido_detail)).setText(mItem);
        }

        return rootView;
    }
}
