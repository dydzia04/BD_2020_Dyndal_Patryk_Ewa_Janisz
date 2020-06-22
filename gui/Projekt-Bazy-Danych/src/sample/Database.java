package sample;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import java.sql.Connection;

public class Database {
    private final Configuration configuration = new Configuration().configure();

    public void test_connect(){
        try {
            SessionFactory sessionFactory = configuration.buildSessionFactory();
            Session session = sessionFactory.openSession();
            session.beginTransaction();

            Connection connection = session.connection();

        } catch (Exception ex) {

        }
    }

    public void add_user(){
    }

    public void add_issue(){}

    public void add_project(){}

    public void close_project(){}

    public void edit_issues_opis(){}

    public void edit_issues_podsumowanie(){}

    public void edit_issues_tytul(){}

    public void edit_project_opis(){}

    public void edit_user_email(){}

    public void edit_user_email_zgoda(){}

    public void edit_user_imie_nazwisko(){}

    public void edit_user_nazwa_wyswietlana(){}
}
