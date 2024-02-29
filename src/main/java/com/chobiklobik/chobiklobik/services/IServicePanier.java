package com.chobiklobik.chobiklobik.services;

import com.chobiklobik.chobiklobik.models.Plat;
import com.chobiklobik.chobiklobik.services.Dto.IdPlats;

import java.sql.SQLException;
import java.util.List;

public interface IServicePanier<T> {
    public void ajouter(T t) throws SQLException;
    public void modifier(T t) throws SQLException;
    public void supprimer(int id) throws SQLException;
    public List<T> recuprer(int id)throws SQLException;
    public  Plat getPlat(int id) throws SQLException;
}
