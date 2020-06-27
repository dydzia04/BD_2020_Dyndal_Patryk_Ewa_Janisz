package sample;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ListView;
import javafx.scene.control.TextField;

import java.net.URL;
import java.util.ResourceBundle;

public class lista_projektow_Controller implements Initializable {
    Database db = new Database();

    @FXML
    private TextField user_id;

    @FXML
    private ListView<?> lista;

    @FXML
    void Dodaj(ActionEvent event) {
        db.changeWindow(event, "dodaj.fxml");
    }


    @FXML
    void Edytuj(ActionEvent event) {
        db.changeWindow(event, "edytuj.fxml");
    }

    @FXML
    void wyloguj(ActionEvent event) {
        db.changeWindow(event, "login.fxml");
    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        db.get_projects();
    }
}
