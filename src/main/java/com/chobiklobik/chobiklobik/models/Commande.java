package com.chobiklobik.chobiklobik.models;

import com.chobiklobik.chobiklobik.services.Dto.IdPlats;

import java.sql.Date;
import java.util.List;

public class Commande {
    private  int id;
    private  float prix;
    private Date dateCommande;
    private String status;
    private int idClient;
    private List<IdPlats> idPlats;

    public Commande() {
    }

    public Commande(int prix, Date dateCommande, String status, int idClient, List<IdPlats> idPlats) {
        this.prix = prix;
        this.dateCommande = dateCommande;
        this.status = status;
        this.idClient = idClient;
        this.idPlats = idPlats;
    }

    public int getID() {
        return id;
    }

    public void setID(int ID) {
        this.id = ID;
    }

    public float getPrix() {
        return prix;
    }

    public void setPrix(float prix) {
        this.prix = prix;
    }

    public Date getDateCommande() {
        return dateCommande;
    }

    public void setDateCommande(Date dateCommande) {
        this.dateCommande = dateCommande;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getIdClient() {
        return idClient;
    }

    public void setIdClient(int idClient) {
        this.idClient = idClient;
    }

    public List<IdPlats> getIdPlats() {
        return idPlats;
    }

    public void setIdPlats(List<IdPlats> idPlats) {
        this.idPlats = idPlats;
    }

    @Override
    public String toString() {
        return "Commande{" +
                "id=" + id +
                ", prix=" + prix +
                ", dateCommande=" + dateCommande +
                ", status='" + status + '\'' +
                ", idClient=" + idClient +
                ", idPlats=" + idPlats +
                '}';
    }
}
