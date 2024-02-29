package com.chobiklobik.chobiklobik.models;

import java.sql.Blob;

public class Plat {
    private int id;
    private  String nom;
    private  int id_category;

    @Override
    public String toString() {
        return nom;
    }
    private Blob imageData;

    public Blob getImageData() {
        return imageData;
    }

    public void setImageData(Blob imageData) {
        this.imageData = imageData;
    }
    private  int id_restaurant;
    private String descreption;
    private  float prix;
    private String image;

    public Plat() {
    }

    public int getId() {
        return id;
    }

    public String getNom() {
        return nom;
    }

    public int getId_category() {
        return id_category;
    }

    public int getId_restaurant() {
        return id_restaurant;
    }

    public String getDescreption() {
        return descreption;
    }

    public float getPrix() {
        return prix;
    }

    public String getImage() {
        return image;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setId_category(int id_category) {
        this.id_category = id_category;
    }

    public void setId_restaurant(int id_restaurant) {
        this.id_restaurant = id_restaurant;
    }

    public void setDescreption(String descreption) {
        this.descreption = descreption;
    }

    public void setPrix(float prix) {
        this.prix = prix;
    }

    public void setImage(String image) {
        this.image = image;
    }

}
