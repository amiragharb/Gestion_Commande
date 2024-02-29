package com.chobiklobik.chobiklobik.services.Dto;

import java.sql.Blob;

public class IdPlats {
    private int idCommande;
    private int idPlats;
    private int idrestrant;
    private int Quatitie;
    private String Statuts;
    private Blob imageData;

    public Blob getImageData() {
        return imageData;
    }

    public void setImageData(Blob imageData) {
        this.imageData = imageData;
    }
    public IdPlats() {
    }

    public IdPlats(int idCommande, int idPlats, int quatitie, String statuts) {
        this.idCommande = idCommande;
        this.idPlats = idPlats;
        Quatitie = quatitie;
        Statuts = statuts;
    }

    public int getIdrestrant() {
        return idrestrant;
    }

    public void setIdrestrant(int idrestrant) {
        this.idrestrant = idrestrant;
    }

    public int getIdCommande() {
        return idCommande;
    }

    public int getIdPlats() {
        return idPlats;
    }

    public int getQuatitie() {
        return Quatitie;
    }

    public String getStatuts() {
        return Statuts;
    }

    public void setIdCommande(int idCommande) {
        this.idCommande = idCommande;
    }

    public void setIdPlats(int idPlats) {
        this.idPlats = idPlats;
    }

    public void setQuatitie(int quatitie) {
        Quatitie = quatitie;
    }

    public void setStatuts(String statuts) {
        Statuts = statuts;
    }

    @Override
    public String toString() {
        return "IdPlats{" +
                "idCommande=" + idCommande +
                ", idPlats=" + idPlats +
                ", Quatitie=" + Quatitie +
                ", Statuts='" + Statuts + '\'' +
                '}';
    }
}