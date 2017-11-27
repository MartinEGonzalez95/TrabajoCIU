package edu.unq.tpi.ciu.dreamteam.clientedominosandroid.services;

/**
 * Created by mariano on 20/11/17.
 */

public class LoginBody {
    private String nick;
    private String password;

    public LoginBody(String nick, String password) {
        this.nick = nick;
        this.password = password;
    }

    public String getNick() {
        return nick;
    }

    public void setNick(String nick) {
        this.nick = nick;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
