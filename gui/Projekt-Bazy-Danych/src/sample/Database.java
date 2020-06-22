package sample;

import javafx.event.ActionEvent;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.io.IOException;

public class Database {
    private final Configuration configuration = new Configuration().configure();

    public void test_connect(){
        try {
            SessionFactory sessionFactory = configuration.buildSessionFactory();
            Session session = sessionFactory.openSession();
            session.beginTransaction();

//            Connection connection = session.connection();

        } catch (Exception ex) {
            ex.getStackTrace();
        }
    }

    public void add_user(){
        System.out.println("Dodaje użytkownika");
    }

    public void add_issue(){
        System.out.println("Dodaje zgłoszenie");
    }

    public void add_project(){
        System.out.println("Dodaje projekt");
    }

    public void close_project(){
        System.out.println("Zamykam projekt");
    }

    public void edit_issues_opis(){
        System.out.println("Edytuje opis zgłoszenia");
    }

    public void edit_issues_podsumowanie(){
        System.out.println("Edytuje podsumowanie");
    }

    public void edit_issues_tytul(){
        System.out.println("Edytuje tytuł");
    }

    public void edit_project_opis(){
        System.out.println("Edytuje opis projektu");
    }

    public void edit_user_email(){
        System.out.println("Edytuje email");
    }

    public void edit_user_email_zgoda(){
        System.out.println("Edytuje zgodę na emial");
    }

    public void edit_user_imie_nazwisko(){
        System.out.println("Edytuje imie i nazwisko");
    }

    public void edit_user_nazwa_wyswietlana(){
        System.out.println("Edytuje nick");
    }


    public void changeWindow(ActionEvent event, String resourceName){
        Parent parent = null;
        try {
            parent = (AnchorPane) FXMLLoader.load(getClass().getResource(resourceName));
        } catch (IOException e) {
            e.printStackTrace();
        }

        Scene scene = new Scene(parent);

        Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow();

        stage.setScene(scene);
    }
}
