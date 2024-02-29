package com.chobiklobik.chobiklobik.services;

import com.chobiklobik.chobiklobik.services.Dto.IdPlats;

import java.sql.SQLException;
import java.util.List;

public interface IServiceCommande<T> {
    public int ajouter(T t) throws SQLException;
    public void ajouterPlat(IdPlats idPlats) throws SQLException;
    public void modifier(T t) throws SQLException;
    public void supprimer(int id) throws SQLException;
    public void supprimerPlat(int id) throws SQLException;
    public List<T> recuperer(int id) throws SQLException;
    public void modifierPlatQ(IdPlats idPlats) throws SQLException;
}
