package sample;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.CheckBox;
import javafx.scene.control.TextField;

public class nowe_kontoController {
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
        String imie_nazwisko = imie.getText() + " " + nazwisko.getText();
        String nickS = nick.getText();
        String mail = email.getText();
        boolean zgodaMail = zgoda.isSelected();

        System.out.println( "Dane:\nImie, nazwisko: "+ imie_nazwisko +"\nnick: "+nickS+"\nemail: "+mail+"\nzgoda: "+zgodaMail);

        if ( db.add_user(imie_nazwisko, nickS, mail, zgodaMail) ){
            db.changeWindow(event, "login.fxml");
        }
        else{
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Błąd");
            alert.setHeaderText("Niepoprawne dane");
            alert.setContentText("Użytkownik nie został wprowadzony do bazy.");

            alert.showAndWait();
        }
    }

    @FXML
    void go_back(ActionEvent event) {
        db.changeWindow(event, "login.fxml");
    }

}
