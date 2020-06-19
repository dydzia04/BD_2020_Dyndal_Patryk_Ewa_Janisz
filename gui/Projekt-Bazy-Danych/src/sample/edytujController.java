package sample;


import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ListView;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;

import java.net.URL;
import java.sql.*;
import java.util.ResourceBundle;


public class edytujController implements Initializable, ControlledScreen {
    ScreensController myController;
    @FXML ListView lista_zgloszen;
    @FXML TextField nazwa_projektu;
    @FXML TextArea opis;

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
    private void dodaj_zgloszenie(ActionEvent event){
        try (
                Connection conn = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/kotki?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC",
                        "root", "toor");
                Statement stmt = conn.createStatement();
        )
        {


        }
        catch(SQLException ex)
            {
                ex.printStackTrace();
            }

    }

}