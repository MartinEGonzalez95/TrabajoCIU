package edu.unq.tpi.ciu.dreamteam.deliveryandroid.domain;

import java.util.List;

/**
 * Created by Gaston on 21/11/2017.
 */

public class Pedido {

    private String cliente;
    private EstadoDTO estadoDePedido;
    private int numero;
    private List<Plato> platos;
    private String aclaraciones;
    private FormaDeEnvioDTO formaDeEnvio;

    public Pedido() {

    }

    public Pedido(String cliente, String estadoDePedido, int id) {
        this.cliente = cliente;
        this.estadoDePedido = new EstadoDTO(estadoDePedido);
        this.numero = id;
    }

    public double montoFinal() {//No se pueden usar los streams...

        return this.precioPorTotalDePlatos() + formaDeEnvio.getCosto();
    }

    private double precioPorTotalDePlatos() {

        double precioDeLosPlatos = 0;
        for (Plato plato:this.platos){
            precioDeLosPlatos += plato.precio();
        }
        return  precioDeLosPlatos;
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

    public List<Plato> getPlatos() {
        return platos;
    }

    public void setPlatos(List<Plato> platos) {
        this.platos = platos;
    }

    public String getAclaraciones() {
        return aclaraciones;
    }

    public void setAclaraciones(String aclaraciones) {
        this.aclaraciones = aclaraciones;
    }

    public void setFormaDeEnvio(FormaDeEnvioDTO formaDeEnvio) {
        this.formaDeEnvio = formaDeEnvio;
    }

    public String getDireccion() {
        return this.formaDeEnvio.getDireccion();
    }
}
