package sample;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.CheckBox;
import javafx.scene.control.TextField;

public class NoweKonto {
    Database db = new Database();

    @FXML
    private TextField imie;

    @FXML
    private TextField nazwisko;

    @FXML
    private TextField nick;

    @FXML
    private TextField email;

    @FXML
    private CheckBox zgoda;

    @FXML
    void add_user(ActionEvent event) {
        System.out.println("Dodaje użytkownika");
    }

    @FXML
    void go_back(ActionEvent event) {
        db.changeWindow(event, "login.fxml");
    }

}
