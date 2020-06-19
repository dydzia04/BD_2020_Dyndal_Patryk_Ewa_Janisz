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
        try (
                Connection conn = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/kotki?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC",
                        "root", "toor"); // TODO: w kazdym pliku zmien sobie ten link i user/pass zeby bylo dobrze
                Statement stmt = conn.createStatement();
        )
        {
            String opis = description.getText();
            String id_projektu = title.getText();


            if (!( id_projektu.isEmpty() || opis.isEmpty()))
            {
                stmt.clearBatch(); // TODO moze trzeba uzupelnic ponizsze jesli kolumny nie bd przyjmowaly " "
                String dodaj = "Insert into Projekt values("+id_projektu+", '"+opis+"')";
                stmt.executeUpdate(dodaj);
            }

        }
        catch(SQLException ex)
            {
                ex.printStackTrace();
            }

    }

}