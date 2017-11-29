package edu.unq.tpi.ciu.dreamteam.deliveryandroid.android;

import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

import edu.unq.tpi.ciu.dreamteam.deliveryandroid.PedidoListActivity;
import edu.unq.tpi.ciu.dreamteam.deliveryandroid.R;
import edu.unq.tpi.ciu.dreamteam.deliveryandroid.domain.Pedido;


public class AdapterForPedidoRow extends RecyclerView.Adapter<AdapterForPedidoRow.ViewHolder> {

    public AdapterForPedidoRow(PedidoListActivity parent,
                               List<Pedido> pedidos) {
        this.pedidos = pedidos;
        this.mParentActivity = parent;

    }

    private final PedidoListActivity mParentActivity;
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
                .inflate(R.layout.pedido_list_content, parent, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(ViewHolder holder, int position) {
        Pedido pedidoActual = pedidos.get(position);

        holder.pedidoIDNumero.setText(String.valueOf(pedidoActual.getNumero()));
        holder.clienteNombrePedido.setText(pedidoActual.getCliente());
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