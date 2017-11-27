package edu.unq.tpi.ciu.dreamteam.clientedominosandroid.services;

import edu.unq.tpi.ciu.dreamteam.clientedominosandroid.domain.Usuario;

/**
 * Created by mariano on 27/11/17.
 */

public class UserService {
    private Usuario usuario;
    private static UserService service = null;

    private UserService() {}

    public static UserService getInstance() {
        if(service == null) {
            service = new UserService();
        }
        return service;
    }

    public void loguearUsuario(Usuario usr) {
        this.usuario = usr;
    }


    public Usuario getUsuario() {
        return usuario;
    }
}
