package sample;


import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.control.TextField;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javafx.scene.control.TextArea;


public class dodajController implements Initializable, ControlledScreen {
    Database db = new Database();

    ScreensController myController;
    @FXML TextArea description;
    @FXML TextField  title;

    @Override
    public void initialize(URL url, ResourceBundle rb) {

    }

    public void setScreenParent(ScreensController screenParent) {
        myController = screenParent;
    }

    @FXML
    private void go_to_base(ActionEvent event){
        myController.setScreen(Main.lista_projektowID);
    }

    @FXML
    private void dodaj_projekt(ActionEvent event){
        db.add_project();
    }

}