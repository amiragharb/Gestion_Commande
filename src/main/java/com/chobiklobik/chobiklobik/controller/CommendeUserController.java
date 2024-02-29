package com.chobiklobik.chobiklobik.controller;

import com.chobiklobik.chobiklobik.models.Commande;
import com.chobiklobik.chobiklobik.services.IServiceCommandeImpl;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.HBox;
import javafx.stage.Stage;
import javafx.util.Callback;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public class CommendeUserController {

    @FXML
    private TableView<Commande> tableView;

    private final IServiceCommandeImpl serviceCommande = new IServiceCommandeImpl();

    @FXML
    public void initialize() {
        initializeTableColumns();
        updateCommandeList();
    }

    public void updateCommandeList() {
        try {
            List<Commande> commandes = serviceCommande.recuperer(1); // id client
            ObservableList<Commande> commandesList = FXCollections.observableArrayList(commandes); // Type spécial
            tableView.setItems(commandesList);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void initializeTableColumns() {
        tableView.getColumns().clear();

        TableColumn<Commande, Integer> idColumn = new TableColumn<>("Id");
        idColumn.setCellValueFactory(new PropertyValueFactory<>("ID"));

        TableColumn<Commande, String> dateColumn = new TableColumn<>("Date");
        dateColumn.setCellValueFactory(new PropertyValueFactory<>("dateCommande"));

        TableColumn<Commande, Double> priceColumn = new TableColumn<>("Prix");
        priceColumn.setCellValueFactory(new PropertyValueFactory<>("prix"));

        tableView.getColumns().addAll(idColumn, dateColumn, priceColumn);
    }



    public void goToPanier(ActionEvent actionEvent) {
         FXMLLoader loader = new FXMLLoader(getClass().getResource("/Panier-view.fxml"));
         try {
             Parent root = loader.load();
            Stage stage = new Stage();
             stage.setScene(new Scene(root));
             stage.setTitle("Panier");
             stage.show();
         } catch (IOException e) {
             e.printStackTrace();
         }
    }
}
