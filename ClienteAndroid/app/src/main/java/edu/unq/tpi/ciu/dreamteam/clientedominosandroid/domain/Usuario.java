package edu.unq.tpi.ciu.dreamteam.clientedominosandroid.domain;

/**
 * Created by mariano on 20/11/17.
 */

public class Usuario {

    private String nombre;
    private String nick;
    private String email;
    private String direccion;


    public Usuario(String nombre, String nick, String email, String direccion) {
        this.nombre = nombre;
        this.nick = nick;
        this.email = email;
        this.direccion = direccion;

    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNick() {
        return nick;
    }

    public void setNick(String nick) {
        this.nick = nick;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }


}
