package com.chobiklobik.chobiklobik.services;

import com.chobiklobik.chobiklobik.models.Plat;
import com.chobiklobik.chobiklobik.services.Dto.IdPlats;

import java.sql.SQLException;
import java.util.List;

public interface IservicePlatCommande<T> {
    public void modifierPlatS(IdPlats idPlats) throws SQLException;
    public List<T> recuperer(int id) throws SQLException;
    public void modifieretat(int id) throws SQLException;
}
