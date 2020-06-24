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
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import java.io.IOException;
import java.util.List;

public class Database {
    private final Configuration configuration = new Configuration()
                                                    .configure()
                                                    .addAnnotatedClass(entity.pozwolenia.class)
                                                    .addAnnotatedClass(entity.prioritet.class)
                                                    .addAnnotatedClass(entity.projekt.class)
                                                    .addAnnotatedClass(entity.role.class)
                                                    .addAnnotatedClass(entity.typ_zgloszenia.class)
                                                    .addAnnotatedClass(entity.utworzone.class)
                                                    .addAnnotatedClass(entity.uzytkownik.class)
                                                    .addAnnotatedClass(entity.zamkniete.class)
                                                    .addAnnotatedClass(entity.zarzadzanie_projektem.class)
                                                    .addAnnotatedClass(entity.zgloszenia.class);

    public void test_connect() {
        SessionFactory factory = configuration.buildSessionFactory();
        Session session = factory.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public boolean add_user( String personalne, String nick, String email, boolean zgoda) {
        System.out.println("Dodaje użytkownika");

        SessionFactory factory = configuration.buildSessionFactory();
        Session session = factory.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();



            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }

        return false;
    }

    public void add_issue() {
        System.out.println("Dodaje zgłoszenie");
    }

    public void add_project() {
        System.out.println("Dodaje projekt");
    }

    public void close_project() {
        System.out.println("Zamykam projekt");
    }

    public void edit_issues_opis() {
        System.out.println("Edytuje opis zgłoszenia");
    }

    public void edit_issues_podsumowanie() {
        System.out.println("Edytuje podsumowanie");
    }

    public void edit_issues_tytul() {
        System.out.println("Edytuje tytuł");
    }

    public void edit_project_opis() {
        System.out.println("Edytuje opis projektu");
    }

    public void edit_user_email() {
        System.out.println("Edytuje email");
    }

    public void edit_user_email_zgoda() {
        System.out.println("Edytuje zgodę na emial");
    }

    public void edit_user_imie_nazwisko() {
        System.out.println("Edytuje imie i nazwisko");
    }

    public void edit_user_nazwa_wyswietlana() {
        System.out.println("Edytuje nick");
    }

    public boolean get_user(String nick) {
        boolean toReturn = false;
        System.out.println("Szukam " + nick);

        SessionFactory factory = configuration.buildSessionFactory();
        Session session = factory.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();

            String hql = "FROM uzytkownik U WHERE U.nick = '" + nick + "'";
            Query query = session.createQuery(hql);

            Integer resultNum = (Integer) query.uniqueResult();

            System.out.println("Ilość: " + resultNum);

            if ( resultNum != null || resultNum > 0 ){
                List result = query.list();

                System.out.println("Użytkownik: " + result.toString());

                //TODO: sprawdzić czy faktycznie znajdzie użytkownika

                tx.commit();

                return true;
            }

            else {
                System.out.println("Dupa z tego");
            }
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }

        return toReturn;
    }

    public void changeWindow(ActionEvent event, String resourceName) {
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
