package edu.unq.tpi.ciu.dreamteam.clientedominosandroid.android;

import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

import edu.unq.tpi.ciu.dreamteam.clientedominosandroid.R;
import edu.unq.tpi.ciu.dreamteam.clientedominosandroid.UsuarioPedidosListActivity;
import edu.unq.tpi.ciu.dreamteam.clientedominosandroid.domain.Pedido;


public class AdapterForPedidoRow extends RecyclerView.Adapter<AdapterForPedidoRow.ViewHolder> {

    public AdapterForPedidoRow(UsuarioPedidosListActivity parent,
                               List<Pedido> pedidos) {
        this.pedidos = pedidos;
        this.mParentActivity = parent;

    }

    private final UsuarioPedidosListActivity mParentActivity;
    private List<Pedido> pedidos = new ArrayList<>();


    private final View.OnClickListener mOnClickListener = new View.OnClickListener() {

        @Override
        public void onClick(View view) {

            Pedido unPedido = (Pedido) view.getTag();
            mParentActivity.irAlFragmentDetalleDePedido(unPedido,view);
        }
    };


    @Override
    public AdapterForPedidoRow.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.usuario_pedidos_list_content, parent, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(ViewHolder holder, int position) {
        Pedido pedidoActual = pedidos.get(position);

        holder.pedidoIDNumero.setText(String.valueOf(pedidoActual.getNumero()));
        holder.estadoActualDePedido.setText(pedidoActual.getEstadoDePedido().getNombre());

        holder.itemView.setTag(pedidoActual);
        holder.itemView.setOnClickListener(mOnClickListener);

    }

    @Override
    public int getItemCount() {
        return pedidos.size();
    }

    class ViewHolder extends RecyclerView.ViewHolder {
        public TextView pedidoIDNumero;
        public TextView estadoActualDePedido;

        ViewHolder(View view) {
            super(view);
            estadoActualDePedido = (TextView) view.findViewById(R.id.estadoPedido);
            pedidoIDNumero = (TextView) view.findViewById(R.id.id_pedido);
        }
    }
}