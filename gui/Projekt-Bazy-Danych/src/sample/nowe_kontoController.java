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

import javax.swing.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class nowe_kontoController implements Initializable, ControlledScreen {

    @FXML TextField imie;
    @FXML TextField nazwisko;
    @FXML TextField nick;
    @FXML TextField email;
    @FXML JCheckBox zgoda;

    ScreensController myController;


    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }

    public void setScreenParent(ScreensController screenParent) {
        myController = screenParent;
    }


    // TODO po podlaczeniu usun ponizsza metoda i odkomentuj dalsza
    @FXML
    private void dodaj_konto(ActionEvent event)
    {

        try (
                Connection conn = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/kotki?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC",
                        "root", "toor"); // TODO: w kazdym pliku zmien sobie ten link i user/pass zeby bylo dobrze
                Statement stmt = conn.createStatement();
        )
        {
            String user_name = imie.getText();
            String user_second_name = nazwisko.getText();
            String user_nick = nick.getText();
            String user_email = email.getText();
            boolean agrred = zgoda.isSelected();

            if (!( user_name.isEmpty() || user_second_name.isEmpty() || user_nick.isEmpty() || user_email.isEmpty() || agrred))
            {
                stmt.clearBatch();
                String dodaj = "Insert into Uzytkownik values("+user_name+", "+user_second_name+", "+user_nick+", "+user_email+", "+agrred+")";
                stmt.executeUpdate(dodaj);
            }
            goToLogin(event);

        }
        catch(SQLException ex)
        {
            ex.printStackTrace();
        }

    }


    @FXML
    private void goToLogin(ActionEvent event) {
        myController.setScreen(Main.lista_projektowID);

    }


}
