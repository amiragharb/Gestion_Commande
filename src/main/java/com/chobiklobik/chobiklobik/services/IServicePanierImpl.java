package com.chobiklobik.chobiklobik.services;

import com.chobiklobik.chobiklobik.models.Panier;
import com.chobiklobik.chobiklobik.models.Plat;
import com.chobiklobik.chobiklobik.utils.mydatabase;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class IServicePanierImpl implements IServicePanier<Panier> {
    private Connection connection;

    public IServicePanierImpl() {
        connection = mydatabase.getInstance().getConnection();
    }

    @Override
    public void ajouter(Panier panier) throws SQLException {
        String reqPlats = "INSERT INTO panies (iduser, idPlats) VALUES (?, ?)";
        PreparedStatement psPlats = connection.prepareStatement(reqPlats);
        psPlats.setInt(1, panier.getIduser());
        psPlats.setInt(2, panier.getIdPlats());
        psPlats.executeUpdate();
    }

    @Override
    public void modifier(Panier panier) throws SQLException {
        // Implement modifier logic if needed
    }

    @Override
    public void supprimer(int id) throws SQLException {
        String req = "DELETE FROM panies WHERE iduser = ?";
        PreparedStatement os = connection.prepareStatement(req);
        os.setInt(1, id);
        os.executeUpdate();
    }

    @Override
    public List<Panier> recuprer(int id) throws SQLException {
        List<Panier> paniers = new ArrayList<>();
        String req = "SELECT * FROM panies WHERE iduser = ?";
        PreparedStatement ps = connection.prepareStatement(req);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Panier panier = new Panier();
            panier.setIduser(rs.getInt("iduser"));
            panier.setIdPlats(rs.getInt("idPlats"));
            paniers.add(panier);
        }
        return paniers;
    }

    @Override
    public Plat getPlat(int id) throws SQLException {
        Plat plat = new Plat();
        String req = "SELECT * FROM plat WHERE id = ?";
        PreparedStatement ps = connection.prepareStatement(req);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            plat.setId(rs.getInt("id"));
            plat.setNom(rs.getString("nom"));
            plat.setId_category(rs.getInt("id_categorY"));
            plat.setId_restaurant(rs.getInt("id_restaurant"));
            plat.setDescreption(rs.getString("description"));
            plat.setPrix(rs.getFloat("prix"));
            plat.setImage(rs.getString("image"));
        }
        return plat;
    }

    public List<Plat> getAllPlats() throws SQLException {
        List<Plat> plats = new ArrayList<>();
        String req = "SELECT * FROM plat";
        Statement statement = connection.createStatement();
        ResultSet rs = statement.executeQuery(req);
        while (rs.next()) {
            Plat plat = new Plat();
            plat.setId(rs.getInt("id"));
            plat.setNom(rs.getString("nom"));
            plat.setId_category(rs.getInt("id_category"));
            plat.setId_restaurant(rs.getInt("id_restaurant"));
            plat.setDescreption(rs.getString("description"));
            plat.setPrix(rs.getFloat("prix"));
            plat.setImage(rs.getString("image"));
            plat.setImageData(rs.getBlob("imageData"));
            plats.add(plat);
        }
        return plats;
    }
}
