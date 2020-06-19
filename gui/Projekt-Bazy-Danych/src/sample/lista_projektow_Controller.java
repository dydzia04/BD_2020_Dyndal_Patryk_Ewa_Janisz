package sample;


import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ListView;
import javafx.scene.control.TextField;
import javafx.scene.control.TextArea;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class lista_projektow_Controller implements Initializable, ControlledScreen {
    ScreensController myController;
    @FXML
    ListView lista;
    @FXML
    TextField usuwator;
    private String nick;

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        wyswietl_liste();
    }

    public void setScreenParent(ScreensController screenParent) {
        myController = screenParent;
    }

    public void setNick(String nickus_maximus) {
        nick = nickus_maximus;
        System.out.println(nick);
    }

    public String getNick() {
        return nick;
    }



    @FXML
    private void Dodaj(ActionEvent event){
        myController.setScreen(Main.dodajID);
    }

    private void wyswietl_liste()
    {
        try (
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/kotki?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC",
                    "root", "toor");
            Statement stmt = conn.createStatement();
            )
        {
            lista.setEditable(false); //?
            String query = "Select * from Projekt";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(query);
            int rowCount = 0;
            String output = "";
            while(rs.next())
            {
                int idzgloszenia = rs.getInt("ID_zgloszenia");
                String opis = rs.getString("Opis");
                ++rowCount;
                lista.getItems().add("ID: " + idzgloszenia + " Tresc: " + opis);

            }
        }
        catch(SQLException ex)
        {
            ex.printStackTrace();
        }
    }



}


