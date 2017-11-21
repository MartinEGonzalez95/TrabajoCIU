package edu.unq.tpi.ciu.dreamteam.clientedominosandroid;

/**
 * Created by mariano on 20/11/17.
 */

class Pedido {
    private int platos;
    private String cliente;
    private String fechaDeCreacion;
    private String aclaraciones;
    private String estadoDePedido;
    private String formaDeEnvio;
    private String numero;

    public Pedido(int platos, String cliente, String fechaDeCreacion, String aclaraciones, String estadoDePedido, String formaDeEnvio, String numero) {
        this.platos = platos;
        this.cliente = cliente;
        this.fechaDeCreacion = fechaDeCreacion;
        this.aclaraciones = aclaraciones;
        this.estadoDePedido = estadoDePedido;
        this.formaDeEnvio = formaDeEnvio;
        this.numero = numero;
    }

    public int getPlatos() {
        return platos;
    }

    public void setPlatos(int platos) {
        this.platos = platos;
    }

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public String getFechaDeCreacion() {
        return fechaDeCreacion;
    }

    public void setFechaDeCreacion(String fechaDeCreacion) {
        this.fechaDeCreacion = fechaDeCreacion;
    }

    public String getAclaraciones() {
        return aclaraciones;
    }

    public void setAclaraciones(String aclaraciones) {
        this.aclaraciones = aclaraciones;
    }

    public String getEstadoDePedido() {
        return estadoDePedido;
    }

    public void setEstadoDePedido(String estadoDePedido) {
        this.estadoDePedido = estadoDePedido;
    }

    public String getFormaDeEnvio() {
        return formaDeEnvio;
    }

    public void setFormaDeEnvio(String formaDeEnvio) {
        this.formaDeEnvio = formaDeEnvio;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }
}
