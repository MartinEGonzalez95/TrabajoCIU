package edu.unq.tpi.ciu.dreamteam.deliveryandroid.domain;

import java.util.List;

/**
 * Created by Gaston on 21/11/2017.
 */

public class Pedido {

    private String cliente;
    private EstadoDTO estadoDePedido;
    private int numero;
  //  private List<Plato> platos;

    public Pedido() {

    }

    public Pedido(String cliente, String estadoDePedido, int id) {
        this.cliente = cliente;
        this.estadoDePedido = new EstadoDTO(estadoDePedido);
        this.numero = id;
    }


    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public EstadoDTO getEstadoDePedido() {
        return estadoDePedido;
    }

    public void setEstadoDePedido(EstadoDTO estadoDePedido) {
        this.estadoDePedido = estadoDePedido;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

//    public List<Plato> getPlatos() {
//        return platos;
//    }

//    public void setPlatos(List<Plato> platos) {
//        this.platos = platos;
//    }
}
