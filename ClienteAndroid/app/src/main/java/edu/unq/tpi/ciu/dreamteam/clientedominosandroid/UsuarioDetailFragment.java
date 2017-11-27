package edu.unq.tpi.ciu.dreamteam.clientedominosandroid;

import android.app.Activity;
import android.support.design.widget.CollapsingToolbarLayout;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import edu.unq.tpi.ciu.dreamteam.clientedominosandroid.domain.Usuario;
import edu.unq.tpi.ciu.dreamteam.clientedominosandroid.services.LoginBody;
import edu.unq.tpi.ciu.dreamteam.clientedominosandroid.services.PedidoAPI;
import edu.unq.tpi.ciu.dreamteam.clientedominosandroid.services.ServiceProvider;
import edu.unq.tpi.ciu.dreamteam.clientedominosandroid.services.UserService;
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

        service = ServiceProvider.getInstance().getService();
        usrLogueado = UserService.getInstance().getUsuario();

        Activity activity = this.getActivity();
        CollapsingToolbarLayout appBarLayout = (CollapsingToolbarLayout) activity.findViewById(R.id.toolbar_layout);
        if (appBarLayout != null) {
            appBarLayout.setTitle(usrLogueado.getNick());
        }
    }

    private void mostrarUsuario(View view) {
        EditText name = view.findViewById(R.id.usr_name);
        name.setText(this.usrLogueado.getNombre());
        EditText email = view.findViewById(R.id.usr_email);
        email.setText(this.usrLogueado.getEmail());
        EditText direccion = view.findViewById(R.id.usr_direccion);
        direccion.setText(this.usrLogueado.getDireccion());


    }

    private void botonEditarUsuario(View view) {
        FloatingActionButton fab = (FloatingActionButton) view.findViewById(R.id.modificar_usuario);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                modificarUsuario();
                Snackbar.make(view, "Replace with your own detail action", Snackbar.LENGTH_LONG)
                        .setAction("Action", null).show();
            }
        });
    }

    private void modificarUsuario() {
        Call<Usuario> call = service.modificarUsuario(usrLogueado.getNick(), usrLogueado);

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
        mostrarUsuario(rootView);
        botonEditarUsuario(rootView);
        return rootView;
    }
}
