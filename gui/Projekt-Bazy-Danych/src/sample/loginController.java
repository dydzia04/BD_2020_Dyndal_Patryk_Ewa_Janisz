package sample;


import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.TextField;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.stage.Stage;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class loginController implements Initializable, ControlledScreen {

    @FXML TextField user_nick;
    ScreensController myController;


    @Override
    public void initialize(URL url, ResourceBundle rb) {
    }

    public void setScreenParent(ScreensController screenParent) {
        myController = screenParent;
    }


    @FXML
    private void zaloguj(ActionEvent event)
    {
        /**
         *
         * Pobieranie wpisanych danych i sprawdzenie z bazą danych, nwm jak przesłać poprawny plik do następnych okien
         *
         */

       boolean is_valid =  true; //TODO zmienic na sprawdz_uzytkownika()
       if(is_valid)
       {
           String nick = user_nick.getText();;
           myController.setScreen(Main.lista_projektowID);
           System.out.println("Rozpoznano uzytkownika");
       }
       else
       {
           Alert alert = new Alert(AlertType.ERROR);
           alert.setTitle("Błąd!");
           alert.setHeaderText("Podano nieporawnego uzytkownika!");
       }
    }

    @FXML
    private void new_account(ActionEvent event)
    {
        myController.setScreen(Main.lista_projektowID);

    }


    @FXML
    private boolean sprawdz_uzytkownika(ActionEvent event, String nick)
    {
        boolean is_valid = false;
        /**
         *
         * Połączenie z bazą i walidacja
         *
         */
        try (
                Connection conn = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/kotki?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC",
                        "admin", "admin");
                Statement stmt = conn.createStatement();
        )
        {
            String query = "Select * from Uzytkownik";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(query);
            while(rs.next()) {
                String query_id = rs.getString("ID_Uzytkownika");
                if (query_id.equals(nick)) {
                    is_valid = true;
                    break;
                }
            }


        }
        catch(SQLException ex)
        {
            ex.printStackTrace();
        }
        return is_valid;
    }

}
