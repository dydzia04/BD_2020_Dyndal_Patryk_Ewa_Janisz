package sample;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.ListView;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;

public class dodajController {
    Database db = new Database();

    @FXML
    private TextField nazwa_projektu;

    @FXML
    private TextArea opis;

    @FXML
    private ListView<?> lista_zgloszen;

    @FXML
    void edytuj_projekt(ActionEvent event) {
        db.changeWindow(event, "edytuj.fxml");
        //TODO: dodać obsługę
    }

    @FXML
    void go_to_base(ActionEvent event) {
        db.changeWindow(event, "lista_projektow.fxml");
    }

    public void dodaj_projekt(ActionEvent actionEvent) {
        System.out.println("Dodaje projekt");
        //TODO: dodać obsługę
    }
}
