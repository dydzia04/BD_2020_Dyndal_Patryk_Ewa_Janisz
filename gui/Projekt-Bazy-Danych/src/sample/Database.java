package sample;

import javafx.event.ActionEvent;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.procedure.ProcedureCall;
import org.hibernate.query.Query;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import entity.*;

import javax.persistence.ParameterMode;

public class Database {
    private final Configuration configuration = new Configuration()
                                                    .configure()
                                                    .addAnnotatedClass(pozwolenia.class)
                                                    .addAnnotatedClass(prioritet.class)
                                                    .addAnnotatedClass(projekt.class)
                                                    .addAnnotatedClass(role.class)
                                                    .addAnnotatedClass(typ_zgloszenia.class)
                                                    .addAnnotatedClass(utworzone.class)
                                                    .addAnnotatedClass(uzytkownik.class)
                                                    .addAnnotatedClass(zamkniete.class)
                                                    .addAnnotatedClass(zarzadzanie_projektem.class)
                                                    .addAnnotatedClass(zgloszenia.class);

    // testowa pusta transkacja do debugu
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
        }
    }

    public boolean add_user( String personalne, String nick, String email, boolean zgoda) {
        SessionFactory factory = configuration.buildSessionFactory();
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();

        System.out.println("Dodaje użytkownika");

        ProcedureCall call = session.createStoredProcedureCall("Add_User");
        call.registerParameter(1, String.class, ParameterMode.IN); // Imie nazwisko
        call.registerParameter(2, String.class, ParameterMode.IN); // nick
        call.registerParameter(3, String.class, ParameterMode.IN); // mail
        call.registerParameter(4, Integer.class, ParameterMode.IN); // zgoda

        Integer zgodaS = zgoda ? 1 : 0;

        call.setParameter(1, personalne);
        System.out.println(personalne);
        call.setParameter(2, nick);
        System.out.println(nick);
        call.setParameter(3, email);
        System.out.println(email);
        call.setParameter(4, zgodaS);
        System.out.println(zgodaS);

        boolean error = false;

        try {
            call.executeUpdate();
            tx.commit();
        }catch (Exception e){
            error = true;
            if (tx != null) tx.rollback();

            e.getStackTrace();

            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Błąd");
            alert.setHeaderText("Niepoprawne dane");
            alert.setContentText(e.getMessage());

            alert.showAndWait();
        }

        return !error;
    }

    public boolean add_issue( String tytul, String opis, String typ, String prioritet, String podsumowanie, String ID_Projektu ) {
        SessionFactory factory = configuration.buildSessionFactory();
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();

        String UserID = sample.Session.getInstance().getUserId();

        System.out.println("Dodaje zgłoszenie dla użytkownika "+UserID);

        ProcedureCall call = session.createStoredProcedureCall("Add_Issue");
        call.registerParameter(1, String.class, ParameterMode.IN); // Tytul
        call.registerParameter(2, String.class, ParameterMode.IN); // Opis
        call.registerParameter(3, String.class, ParameterMode.IN); // Typ
        call.registerParameter(4, String.class, ParameterMode.IN); // Prioritet
        call.registerParameter(5, String.class, ParameterMode.IN); // Podsumowanie
        call.registerParameter(6, String.class, ParameterMode.IN); // ID Projektu
        call.registerParameter(7, String.class, ParameterMode.IN); // ID Użytkownika

        call.setParameter(1, tytul);
        call.setParameter(2, opis);
        call.setParameter(3, typ);
        call.setParameter(4, prioritet);
        call.setParameter(5, podsumowanie);
        call.setParameter(6, ID_Projektu);
        call.setParameter(7, UserID);

        boolean error = false;

        try {
            call.executeUpdate();
            tx.commit();
        }catch (Exception e){
            error = true;
            if (tx != null) tx.rollback();

            e.getStackTrace();

            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Błąd");
            alert.setHeaderText("Niepoprawne dane");
            alert.setContentText(e.getMessage());

            alert.showAndWait();
        }

        return !error;
    }

    public boolean add_project( String opis) {
        SessionFactory factory = configuration.buildSessionFactory();
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();

        String UserID = sample.Session.getInstance().getUserId();

        System.out.println("Dodaje projekt dla użytkownika "+UserID);

        ProcedureCall call = session.createStoredProcedureCall("Add_Project");
        call.registerParameter(1, String.class, ParameterMode.IN); // Opis
        call.registerParameter(2, String.class, ParameterMode.IN); // ID Użytkownika

        call.setParameter(1, opis);
        call.setParameter(2, UserID);

        boolean error = false;

        try {
            call.executeUpdate();
            tx.commit();
        }catch (Exception e){
            error = true;
            if (tx != null) tx.rollback();

            e.getStackTrace();

            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Błąd");
            alert.setHeaderText("Niepoprawne dane");
            alert.setContentText(e.getMessage());

            alert.showAndWait();
        }

        return !error;
    }

    public boolean close_project( String ID_Zgloszenia ) {
        SessionFactory factory = configuration.buildSessionFactory();
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();

        String UserID = sample.Session.getInstance().getUserId();

        System.out.println("Zamykam zgłoszenie "+ ID_Zgloszenia +" użytkownika "+UserID);

        ProcedureCall call = session.createStoredProcedureCall("Add_Close");
        call.registerParameter(1, String.class, ParameterMode.IN); // ID Użytkownika
        call.registerParameter(2, String.class, ParameterMode.IN); // ID Zgłoszenia

        call.setParameter(1, UserID);
        call.setParameter(2, ID_Zgloszenia);

        boolean error = false;

        try {
            call.executeUpdate();
            tx.commit();
        }catch (Exception e){
            error = true;
            if (tx != null) tx.rollback();

            e.getStackTrace();

            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Błąd");
            alert.setHeaderText("Niepoprawne dane");
            alert.setContentText(e.getMessage());

            alert.showAndWait();
        }

        return !error;
    }

    public boolean edit_issues_podsumowanie( String ID_Zgloszenia, String podsumowanie ) {
        SessionFactory factory = configuration.buildSessionFactory();
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();

        System.out.println("Edytuje podsumowanie zgłoszenia");

        ProcedureCall call = session.createStoredProcedureCall("Edit_Issues_Podsumowanie");
        call.registerParameter(1, String.class, ParameterMode.IN); // ID Zgloszenia
        call.registerParameter(2, String.class, ParameterMode.IN); // podsumowanie

        call.setParameter(1, ID_Zgloszenia);
        call.setParameter(2, podsumowanie);

        boolean error = false;

        try {
            call.executeUpdate();
            tx.commit();
        }catch (Exception e){
            error = true;
            if (tx != null) tx.rollback();

            e.getStackTrace();

            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Błąd");
            alert.setHeaderText("Niepoprawne dane");
            alert.setContentText(e.getMessage());

            alert.showAndWait();
        }

        return !error;
    }

    public boolean edit_issues_opis( String ID_Zgloszenia, String opis ) {
        SessionFactory factory = configuration.buildSessionFactory();
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();

        System.out.println("Edytuje opis zgłoszenia");

        ProcedureCall call = session.createStoredProcedureCall("Edit_Issues_Opis");
        call.registerParameter(1, String.class, ParameterMode.IN); // ID Zgloszenia
        call.registerParameter(2, String.class, ParameterMode.IN); // opis

        call.setParameter(1, ID_Zgloszenia);
        call.setParameter(2, opis);

        boolean error = false;

        try {
            call.executeUpdate();
            tx.commit();
        }catch (Exception e){
            error = true;
            if (tx != null) tx.rollback();

            e.getStackTrace();

            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Błąd");
            alert.setHeaderText("Niepoprawne dane");
            alert.setContentText(e.getMessage());

            alert.showAndWait();
        }

        return !error;
    }

    public boolean edit_issues_tytul( String ID_Zgloszenia, String tytul ) {
        SessionFactory factory = configuration.buildSessionFactory();
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();

        System.out.println("Edytuje tytuł zgłoszenia");

        ProcedureCall call = session.createStoredProcedureCall("Edit_Issues_Tytul");
        call.registerParameter(1, String.class, ParameterMode.IN); // ID Zgloszenia
        call.registerParameter(2, String.class, ParameterMode.IN); // tytuł

        call.setParameter(1, ID_Zgloszenia);
        call.setParameter(2, tytul);

        boolean error = false;

        try {
            call.executeUpdate();
            tx.commit();
        }catch (Exception e){
            error = true;
            if (tx != null) tx.rollback();

            e.getStackTrace();

            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Błąd");
            alert.setHeaderText("Niepoprawne dane");
            alert.setContentText(e.getMessage());

            alert.showAndWait();
        }

        return !error;
    }

    public boolean edit_project_opis( String ID_Projektu, String opis ) {
        SessionFactory factory = configuration.buildSessionFactory();
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();

        System.out.println("Edytuje opis projektu");

        ProcedureCall call = session.createStoredProcedureCall("Edit_Project_Opis");
        call.registerParameter(1, String.class, ParameterMode.IN); // ID Projektu
        call.registerParameter(2, String.class, ParameterMode.IN); // opis

        call.setParameter(1, ID_Projektu);
        call.setParameter(2, opis);

        boolean error = false;

        try {
            call.executeUpdate();
            tx.commit();
        }catch (Exception e){
            error = true;
            if (tx != null) tx.rollback();

            e.getStackTrace();

            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Błąd");
            alert.setHeaderText("Niepoprawne dane");
            alert.setContentText(e.getMessage());

            alert.showAndWait();
        }

        return !error;
    }

    public boolean edit_user_email( String email ) {
        SessionFactory factory = configuration.buildSessionFactory();
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();

        String UserID = sample.Session.getInstance().getUserId();

        System.out.println("Edytuje email użytkownika " + UserID);

        ProcedureCall call = session.createStoredProcedureCall("Edit_User_Email");
        call.registerParameter(1, String.class, ParameterMode.IN); // ID Użytkownika
        call.registerParameter(2, String.class, ParameterMode.IN); // email

        call.setParameter(1, UserID);
        call.setParameter(2, email);

        boolean error = false;

        try {
            call.executeUpdate();
            tx.commit();
        }catch (Exception e){
            error = true;
            if (tx != null) tx.rollback();

            e.getStackTrace();

            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Błąd");
            alert.setHeaderText("Niepoprawne dane");
            alert.setContentText(e.getMessage());

            alert.showAndWait();
        }

        return !error;
    }

    public boolean edit_user_email_zgoda( Integer zgoda ) {
        SessionFactory factory = configuration.buildSessionFactory();
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();

        String UserID = sample.Session.getInstance().getUserId();

        System.out.println("Edytuje zgodę na emial użytkownika " + UserID);

        ProcedureCall call = session.createStoredProcedureCall("Edit_User_Email_Newsletter");
        call.registerParameter(1, String.class, ParameterMode.IN); // ID Użytkownika
        call.registerParameter(2, Integer.class, ParameterMode.IN); // zgoda

        call.setParameter(1, UserID);
        call.setParameter(2, zgoda);

        boolean error = false;

        try {
            call.executeUpdate();
            tx.commit();
        }catch (Exception e){
            error = true;
            if (tx != null) tx.rollback();

            e.getStackTrace();

            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Błąd");
            alert.setHeaderText("Niepoprawne dane");
            alert.setContentText(e.getMessage());

            alert.showAndWait();
        }

        return !error;
    }

    public boolean edit_user_imie_nazwisko( String imie_nazwisko) {
        SessionFactory factory = configuration.buildSessionFactory();
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();

        String UserID = sample.Session.getInstance().getUserId();

        System.out.println("Edytuje imie i nazwisko użytkownika " + UserID);

        ProcedureCall call = session.createStoredProcedureCall("Edit_User_Imie_Nazwisko");
        call.registerParameter(1, String.class, ParameterMode.IN); // ID Użytkownika
        call.registerParameter(2, String.class, ParameterMode.IN); // imie i nazwisko

        call.setParameter(1, UserID);
        call.setParameter(2, imie_nazwisko);

        boolean error = false;

        try {
            call.executeUpdate();
            tx.commit();
        }catch (Exception e){
            error = true;
            if (tx != null) tx.rollback();

            e.getStackTrace();

            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Błąd");
            alert.setHeaderText("Niepoprawne dane");
            alert.setContentText(e.getMessage());

            alert.showAndWait();
        }

        return !error;
    }

    public boolean edit_user_nazwa_wyswietlana( String nick ) {
        SessionFactory factory = configuration.buildSessionFactory();
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();

        String UserID = sample.Session.getInstance().getUserId();

        System.out.println("Edytuje nick użytkownika " + UserID);

        ProcedureCall call = session.createStoredProcedureCall("Edit_User_Nazwa_Wyswietlana");
        call.registerParameter(1, String.class, ParameterMode.IN); // ID Użytkownika
        call.registerParameter(2, String.class, ParameterMode.IN); // nick

        call.setParameter(1, UserID);
        call.setParameter(2, nick);

        boolean error = false;

        try {
            call.executeUpdate();
            tx.commit();
        }catch (Exception e){
            error = true;
            if (tx != null) tx.rollback();

            e.getStackTrace();

            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Błąd");
            alert.setHeaderText("Niepoprawne dane");
            alert.setContentText(e.getMessage());

            alert.showAndWait();
        }

        return !error;
    }

    public boolean get_user(String nick) {
        SessionFactory factory = configuration.buildSessionFactory();
        Session session = factory.openSession();

        boolean toReturn = false;
        System.out.println("Szukam " + nick);

        Transaction tx = null;

        try {

            tx = session.beginTransaction();

            String hql = "select id from uzytkownik u where u.nick='" + nick + "'";

            Query query = session.createQuery(hql);

            System.out.println(query);

            Object result = query.getSingleResult();

            if (result != null) {

                sample.Session loginSession = sample.Session.getInstance();

                loginSession.setUserId((String) result);

                System.out.println(loginSession.getUserId());

                tx.commit();

                return true;
            }
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }

        return toReturn;
    }

    public List get_projects(){
        SessionFactory factory = configuration.buildSessionFactory();
        Session session = factory.openSession();

        String userID = sample.Session.getInstance().getUserId();

        System.out.println("Szukam projektów " + userID);

        Transaction tx = null;

        try {

            tx = session.beginTransaction();

            String hql = "from zarzadzanie_projektem z where z.user_id='" + userID + "'";

            Query query = session.createQuery(hql);

            return query.getResultList();

        }catch (Exception e) {
            e.printStackTrace();
        }

            return null;
    }

    public void changeWindow(ActionEvent event, String resourceName) {
        Parent parent = null;
        try {
            parent = (AnchorPane) FXMLLoader.load(getClass().getResource(resourceName));
        } catch (IOException e) {
            e.printStackTrace();
        }

        assert parent != null;
        Scene scene = new Scene(parent);

        Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow();

        stage.setScene(scene);
    }
}
