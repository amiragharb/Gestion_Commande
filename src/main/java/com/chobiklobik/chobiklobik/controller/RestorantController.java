package com.chobiklobik.chobiklobik.controller;

import com.chobiklobik.chobiklobik.models.Commande;
import com.chobiklobik.chobiklobik.models.Plat;
import com.chobiklobik.chobiklobik.services.Dto.IdPlats;
import com.chobiklobik.chobiklobik.services.IServiceCommandeImpl;
import com.chobiklobik.chobiklobik.services.IServicePanierImpl;
import com.chobiklobik.chobiklobik.services.IservicePlatCommandeImpl;
import javafx.application.Platform;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleObjectProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.StackPane;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class RestorantController {
    @FXML
    private TableView<IdPlats> tableView;

    @FXML
    private TableColumn<IdPlats, Integer> idColumn;

    @FXML
    private TableColumn<IdPlats, String> nomColumn;

    @FXML
    private TableColumn<IdPlats, Integer> quantiteColumn;

    @FXML
    private TableColumn<IdPlats, String> statutColumn;
    @FXML
    private TableColumn<IdPlats, StackPane> imageColumn;

    private final IservicePlatCommandeImpl iservicePlatCommande = new IservicePlatCommandeImpl();

    @FXML
    public void initialize() {
        initializeTableColumns();
        afficher();
    }

    private void initializeTableColumns() {
        idColumn.setCellValueFactory(new PropertyValueFactory<>("idCommande"));
        nomColumn.setCellValueFactory(cellData -> {
            int idPlat = cellData.getValue().getIdPlats();
            Plat plat = getPlatFromId(idPlat);
            return new SimpleStringProperty(plat.getNom());
        });
        quantiteColumn.setCellValueFactory(new PropertyValueFactory<>("quatitie"));

        statutColumn.setCellValueFactory(new PropertyValueFactory<>("statuts"));
        statutColumn.setCellFactory(param -> {
            return new TableCell<IdPlats, String>() {
                final ComboBox<String> statusComboBox = new ComboBox<>();

                {
                    statusComboBox.getItems().addAll("Accepter", "En Attente du livraire", "En Livraison", "Livré");
                    statusComboBox.setOnAction(event -> {
                        String newStatus = statusComboBox.getValue();
                        IdPlats selectedPlat = getTableView().getItems().get(getIndex());
                        String oldStatus = selectedPlat.getStatuts();
                        if (!newStatus.equals(oldStatus)) {
                            selectedPlat.setStatuts(newStatus);
                            try {
                                iservicePlatCommande.modifierPlatS(selectedPlat);
                                afficher();
                                showSuccessAlert("Statut Modifié", "Le statut du plat a été modifié avec succès.");
                            } catch (SQLException e) {
                                e.printStackTrace();
                                showErrorAlert("Erreur", "Une erreur s'est produite lors de la modification du statut du plat.");
                            }
                        }
                    });
                }

                @Override
                protected void updateItem(String item, boolean empty) {
                    super.updateItem(item, empty);
                    if (empty) {
                        setGraphic(null);
                    } else {
                        statusComboBox.setValue(item);
                        setGraphic(statusComboBox);
                    }
                }
            };
        });
        imageColumn.setCellValueFactory(cellData -> {
            ImageView imageView = new ImageView();
            imageView.setFitWidth(100);
            imageView.setFitHeight(100);

            StackPane stackPane = new StackPane();
            stackPane.getChildren().add(imageView);

            IdPlats plat = cellData.getValue();
            Blob imageData = plat.getImageData();

            if (imageData != null) {
                try {
                    byte[] bytes = imageData.getBytes(1, (int) imageData.length());
                    Image image = new Image(new ByteArrayInputStream(bytes));
                    imageView.setImage(image);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            return new SimpleObjectProperty<>(stackPane);
        });
    }

    private Plat getPlatFromId(int idPlat) {
        Plat p = new Plat();
        IServicePanierImpl iServicePanier = new IServicePanierImpl();
        try {
            p = iServicePanier.getPlat(idPlat);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return p;
    }

    public void afficher() {
        List<IdPlats> listPlat = new ArrayList<>();
        try {
            listPlat = iservicePlatCommande.recuperer(1); //resto id
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        tableView.getItems().setAll(listPlat);
    }







    private void showSuccessAlert(String title, String content) {
        Platform.runLater(() -> {
            Alert alert = new Alert(Alert.AlertType.INFORMATION);
            alert.setTitle(title);
            alert.setHeaderText(null);
            alert.setContentText(content);
            alert.showAndWait();
        });
    }

    private void showErrorAlert(String title, String content) {
        Platform.runLater(() -> {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle(title);
            alert.setHeaderText(null);
            alert.setContentText(content);
            alert.showAndWait();
        });
    }
}
