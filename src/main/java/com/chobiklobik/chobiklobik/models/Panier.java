package com.chobiklobik.chobiklobik.models;


public class Panier {
    private int iduser;
    private int  idPlats;

    public Panier() {
    }

    public Panier(int iduser, int idPlats) {
        this.iduser = iduser;
        this.idPlats = idPlats;
    }

    public int getIduser() {
        return iduser;
    }

    public void setIduser(int iduser) {
        this.iduser = iduser;
    }

    public int getIdPlats() {
        return idPlats;
    }

    public void setIdPlats(int idPlats) {
        this.idPlats = idPlats;
    }
}
