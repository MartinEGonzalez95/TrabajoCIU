package edu.unq.tpi.ciu.dreamteam.clientedominosandroid.android;

import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

import edu.unq.tpi.ciu.dreamteam.clientedominosandroid.PedidoDetailFragment;
import edu.unq.tpi.ciu.dreamteam.clientedominosandroid.R;
import edu.unq.tpi.ciu.dreamteam.clientedominosandroid.UsuarioDetailFragment;
import edu.unq.tpi.ciu.dreamteam.clientedominosandroid.domain.Plato;

/**
 * Created by franc on 29/11/2017.
 */

public class AdapterForPlatoRow extends RecyclerView.Adapter<AdapterForPlatoRow.ViewHolder> {

    public AdapterForPlatoRow(PedidoDetailFragment parent,
                              List<Plato> platos) {
        this.platos = platos;
        this.mParentActivity = parent;

    }

    private final PedidoDetailFragment mParentActivity;
    private List<Plato> platos = new ArrayList<>();

    @Override
    public AdapterForPlatoRow.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.platos_list_content, parent, false);
        return new AdapterForPlatoRow.ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(AdapterForPlatoRow.ViewHolder holder, int position) {
        Plato platoActual = platos.get(position);

        holder.platoNombre.setText(String.valueOf(platoActual.getPizzaNombre().getNombre()));

        holder.itemView.setTag(platoActual);

    }

    @Override
    public int getItemCount() {
        return platos.size();
    }

    class ViewHolder extends RecyclerView.ViewHolder {
        public TextView platoNombre;


        ViewHolder(View view) {
            super(view);
            platoNombre = (TextView) view.findViewById(R.id.pedido_plato);
        }
    }

}
