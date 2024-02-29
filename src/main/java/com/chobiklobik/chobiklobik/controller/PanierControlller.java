package com.chobiklobik.chobiklobik.controller;

import com.chobiklobik.chobiklobik.models.Commande;
import com.chobiklobik.chobiklobik.models.ListeFinalResrv;
import com.chobiklobik.chobiklobik.models.Panier;
import com.chobiklobik.chobiklobik.models.Plat;
import com.chobiklobik.chobiklobik.services.Dto.IdPlats;
import com.chobiklobik.chobiklobik.services.IServiceCommandeImpl;
import com.chobiklobik.chobiklobik.services.IServicePanierImpl;
import com.chobiklobik.chobiklobik.services.IservicePlatCommandeImpl;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.scene.image.Image;
import javafx.stage.Stage;


import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class PanierControlller {
    @FXML
    private Label nomLabel;

    @FXML
    private Label prixLabel;

    @FXML
    private Label descriptionLabel;

    @FXML
    private Spinner<Integer> quantiteSpinner;

    @FXML
    private ListView<ListeFinalResrv> listeV2;

    @FXML
    private Label prixF;

    @FXML
    private ComboBox<Plat> platComboBox;

    @FXML
    private ImageView imagePlat;
    @FXML
    private TextField quantiteField;

    private final ObservableList<ListeFinalResrv> panierItems = FXCollections.observableArrayList();

    private final IServicePanierImpl servicePanier = new IServicePanierImpl();

    @FXML
    public void initialize() {
        try {
            List<Plat> allPlats = new ArrayList<>(servicePanier.getAllPlats());

            ObservableList<Plat> platItems = FXCollections.observableArrayList(allPlats);
            platComboBox.setItems(platItems);
            platComboBox.setCellFactory(param -> new ListCell<Plat>() {
                @Override
                protected void updateItem(Plat plat, boolean empty) {
                    super.updateItem(plat, empty);
                    if (empty || plat == null) {
                        setText(null);
                    } else {
                        setText(plat.getNom());
                    }
                }
            });
        } catch (SQLException e) {
            e.printStackTrace();
        }
        platComboBox.valueProperty().addListener((obs, oldVal, newVal) -> {
            updatePlatInfo(newVal);
        });
        // Set up the ListView for panier
        listeV2.setItems(panierItems);
        listeV2.setCellFactory(param -> new ListCell<ListeFinalResrv>() {
            @Override
            protected void updateItem(ListeFinalResrv item, boolean empty) {
                super.updateItem(item, empty);
                if (empty || item == null) {
                    setText(null);
                } else {
                    setText("Plat: " + item.getNom() + ", Prix: " + item.getPrix() + ", Quantité: " + item.getQt());
                }
            }
        });
    }

    public void updatePlatInfo(Plat plat) {
        if (plat != null) {
            nomLabel.setText(plat.getNom());
            prixLabel.setText(String.valueOf(plat.getPrix()));
            descriptionLabel.setText(plat.getDescreption());
            Blob imageData = plat.getImageData();
            if (imageData != null) {
                try {
                    byte[] bytes = imageData.getBytes(1, (int) imageData.length());
                    Image image = new Image(new ByteArrayInputStream(bytes));
                    imagePlat.setImage(image);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } else {
            nomLabel.setText("");
            prixLabel.setText("");
            descriptionLabel.setText("");
        }
    }

    @FXML
    public void ajouterPlatAuPanier() {
        Plat selectedPlat = platComboBox.getValue();
        if (selectedPlat == null) {
            return;
        }
        int quantite = quantiteSpinner.getValue();
        if (quantite <= 0) {
            showErrorAlert("Quantité invalide", "La quantité doit être supérieure à zéro.");
            return;
        }

        ListeFinalResrv panierItem = new ListeFinalResrv();
        panierItem.setId(selectedPlat.getId());
        panierItem.setNom(selectedPlat.getNom());
        panierItem.setPrix(selectedPlat.getPrix());
        panierItem.setQt(quantite);

        panierItems.add(panierItem);
        updateTotalPrice();
        showSuccessAlert("Plat ajouté au panier", "Le plat a été ajouté au panier avec succès.");
    }

    @FXML
    public void supprimerPlatDuPanier() {
        int selectedIndex = listeV2.getSelectionModel().getSelectedIndex();
        if (selectedIndex >= 0) {
            panierItems.remove(selectedIndex);
            updateTotalPrice();
        }
    }
    private Stage stage; // Store the reference to the Stage

    @FXML
    public void confirmerCommande() {
        if (listeV2.getItems().isEmpty()) { // si panier vide
            showErrorAlert("Panier vide", "Le panier est vide. Veuillez ajouter des plats avant de confirmer la commande.");
            return;
        }

        float totalPrix = calculateTotalPrice(); // calculer prix totale

        Commande commande = new Commande(); // creer une instance de commande vide
        commande.setIdClient(1);// A modifier
        commande.setPrix(totalPrix);

        IServiceCommandeImpl iServiceCommande = new IServiceCommandeImpl();

        try {
            int idCommande = iServiceCommande.ajouter(commande);

            for (ListeFinalResrv p : listeV2.getItems()) {
                IdPlats idPlats = new IdPlats();
                idPlats.setStatuts("En cours");
                idPlats.setQuatitie(p.getQt());
                idPlats.setIdPlats(p.getId());
                idPlats.setIdrestrant(1); // A MODIFIER
                idPlats.setIdCommande(idCommande);

                iServiceCommande.ajouterPlat(idPlats);
            }

            listeV2.getItems().clear();
            prixF.setText("0");

            showSuccessAlert("Commande confirmée", "Votre commande a été confirmée avec succès.");
            // ADD CLOSE WINDOW HERE
            if (stage != null) {
                stage.close();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private float calculateTotalPrice() {
        float totalPrix = 0;
        for (ListeFinalResrv item : panierItems) {
            totalPrix += item.getPrix() * item.getQt();
        }
        return totalPrix;
    }

    private void updateTotalPrice() {
        float totalPrix = 0;
        for (ListeFinalResrv item : panierItems) {
            totalPrix += item.getPrix() * item.getQt();
        }
        prixF.setText(String.valueOf(totalPrix));
    }

    private void showSuccessAlert(String title, String message) {
        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle(title);
        alert.setHeaderText(null);
        alert.setContentText(message);
        alert.showAndWait();
    }

    private void showErrorAlert(String title, String message) {
        Alert alert = new Alert(Alert.AlertType.ERROR);
        alert.setTitle(title);
        alert.setHeaderText(null);
        alert.setContentText(message);
        alert.showAndWait();
    }
}
