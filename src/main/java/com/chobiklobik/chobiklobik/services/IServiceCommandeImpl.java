package com.chobiklobik.chobiklobik.services;

import com.chobiklobik.chobiklobik.models.Commande;
import com.chobiklobik.chobiklobik.services.Dto.IdPlats;
import com.chobiklobik.chobiklobik.utils.mydatabase;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class IServiceCommandeImpl implements IServiceCommande<Commande> {
    private Connection connection;
    public IServiceCommandeImpl(){
        connection= mydatabase.getInstance().getConnection();
    }
    @Override
    public int ajouter(Commande commande) throws SQLException {
        String reqCommande = "INSERT INTO commandes (prix, idClient) VALUES (?, ?)";
        PreparedStatement psCommande = connection.prepareStatement(reqCommande, Statement.RETURN_GENERATED_KEYS);
        psCommande.setFloat(1, commande.getPrix());
        psCommande.setInt(2, commande.getIdClient());
        psCommande.executeUpdate();

        ResultSet rs = psCommande.getGeneratedKeys();
        int commandeId = 0;
        if (rs.next()) {
            commandeId = rs.getInt(1);
        }
        return commandeId;

    }
    @Override
    public void ajouterPlat(IdPlats idPlats) throws SQLException {
        String reqPlats = "INSERT INTO commande_plats (idCommande, idPlat,Quatitie,idrestrant,status) VALUES (?, ?,?,?,?)";
        PreparedStatement psPlats = connection.prepareStatement(reqPlats);

            psPlats.setInt(1, idPlats.getIdCommande());
            psPlats.setInt(2, idPlats.getIdPlats());
            psPlats.setInt(3, idPlats.getQuatitie());
            psPlats.setInt(4,idPlats.getIdrestrant());
            psPlats.setString(5, idPlats.getStatuts());
            psPlats.executeUpdate();

    }
    @Override
    public void modifier(Commande commande) throws SQLException {
        String req = "UPDATE commandes SET prix = ?, dateCommande = ?,status = ?,idClient = ? WHERE id = ?";
        PreparedStatement os = connection.prepareStatement(req);
        os.setFloat(1 , commande.getPrix());
        os.setDate(2, commande.getDateCommande());
        os.setString(3, commande.getStatus());
        os.setInt(4, commande.getIdClient());
        os.setInt(5,commande.getID());


        os.executeUpdate();
        System.out.println("Categorie modifiee avec succes");
    }
    @Override
    public void modifierPlatQ(IdPlats idPlats) throws SQLException {
        String reqPlats = "UPDATE commande_plats SET Quatitie = ?, WHERE idPlats = ?";
        PreparedStatement psPlats = connection.prepareStatement(reqPlats);
        psPlats.setInt(1, idPlats.getQuatitie());
        psPlats.setInt(2, idPlats.getIdPlats());
        psPlats.executeUpdate();

    }

    @Override
    public void supprimer(int id) throws SQLException {
        String req = "DELETE FROM commandes WHERE id = ?";
        PreparedStatement os = connection.prepareStatement(req);
        os.setInt(1, id);
        os.executeUpdate();
    }
    @Override
    public void supprimerPlat(int id) throws SQLException {
        String req = "DELETE FROM commande_plats WHERE idCommande = ?";
        PreparedStatement os = connection.prepareStatement(req);
        os.setInt(1, id);
        os.executeUpdate();
    }

    @Override
    public List<Commande> recuperer(int id) throws SQLException {
        List<Commande> commandes = new ArrayList<>();
        String req = "SELECT * FROM commandes WHERE idClient=?";
        PreparedStatement os = connection.prepareStatement(req);
        os.setInt(1, id);
        ResultSet rs = os.executeQuery();
        while (rs.next()) {
            Commande commande = new Commande();
            commande.setID(rs.getInt("id"));
            commande.setPrix(rs.getInt("prix"));
            commande.setDateCommande(rs.getDate("dateCommande"));
            commande.setIdClient(rs.getInt("idClient"));
            int idCommande = rs.getInt("id");
            List<IdPlats> listePlas = new ArrayList<>();
            String req1 = "SELECT * FROM commande_plats WHERE idCommande=?";
            PreparedStatement os1 = connection.prepareStatement(req1);
            os1.setInt(1, idCommande);
            ResultSet rs1 = os1.executeQuery();
            while (rs1.next()) {
                IdPlats idPlats = new IdPlats();
                idPlats.setIdCommande(rs1.getInt("idCommande"));
                idPlats.setIdPlats(rs1.getInt("idPlat"));
                idPlats.setQuatitie(rs1.getInt("Quatitie"));
                idPlats.setStatuts(rs1.getString("status"));
                listePlas.add(idPlats);
            }
            commande.setIdPlats(listePlas);
            commandes.add(commande);
        }
        return commandes;
    }

}
