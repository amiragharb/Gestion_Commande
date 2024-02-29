package com.chobiklobik.chobiklobik.services;

import com.chobiklobik.chobiklobik.models.Commande;
import com.chobiklobik.chobiklobik.models.Plat;
import com.chobiklobik.chobiklobik.services.Dto.IdPlats;
import com.chobiklobik.chobiklobik.utils.mydatabase;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class IservicePlatCommandeImpl implements IservicePlatCommande<IdPlats> {
    private Connection connection;
    public IservicePlatCommandeImpl(){
        connection= mydatabase.getInstance().getConnection();
    }
    @Override
    public void modifierPlatS(IdPlats idPlats) throws SQLException {
        String reqPlats = "UPDATE commande_plats SET status = ? WHERE idPlat = ?";
        PreparedStatement psPlats = connection.prepareStatement(reqPlats);
        psPlats.setString(1, idPlats.getStatuts());
        psPlats.setInt(2, idPlats.getIdPlats());
        psPlats.executeUpdate();
    }


    @Override
    public List<IdPlats> recuperer(int id) throws SQLException {
        List<IdPlats> idPlats = new ArrayList<>();
        String req = "SELECT * FROM commande_plats WHERE idrestrant=?";
        String req2 = "SELECT imageData FROM plat WHERE id=?";
        PreparedStatement os = connection.prepareStatement(req);
        os.setInt(1, id);
        ResultSet rs = os.executeQuery();
        while (rs.next()) {
            IdPlats idPlats1 = new IdPlats();
            idPlats1.setIdCommande(rs.getInt("idCommande"));
            idPlats1.setIdPlats(rs.getInt("idPlat"));
            idPlats1.setQuatitie(rs.getInt("Quatitie"));
            idPlats1.setStatuts(rs.getString("status"));
            PreparedStatement os2=connection.prepareStatement(req2);
            os2.setInt(1,idPlats1.getIdPlats());
            ResultSet rs2 = os2.executeQuery();
rs2.next();
            System.out.println(rs2.getBlob("imageData"));
            idPlats1.setImageData(rs2.getBlob("imageData"));
            idPlats1.setIdrestrant(id);
            idPlats.add(idPlats1);
        }
        return idPlats;
    }

    @Override
    public void modifieretat(int id) throws SQLException {

    }

}
