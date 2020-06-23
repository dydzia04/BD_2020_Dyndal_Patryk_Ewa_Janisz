package sample;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.TextField;

public class loginController {
    Database db = new Database();

    @FXML
    private TextField user_nick;

    @FXML
    void new_account(ActionEvent event) {
        db.changeWindow(event, "nowe_konto.fxml");
    }

    @FXML
    void zaloguj(ActionEvent event) {
        String nick = user_nick.getText();

        db.get_user(nick);

        db.changeWindow(event, "lista_projektow.fxml");
    }

}