package sample;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Group;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

public class Main extends Application {
    /**
     *
     * ładujemy tutaj wszystkie pliki FXML tak aby możliwe było płynne przechodzenie między nimi bez konieczności tworzenia
     * nowych okien i zamykania starych non stop
     *
     */
    public static String homeID = "login";
    public static String homeFile = "login.fxml";
    public static String lista_projektowID = "lista_projektow";
    public static String lista_projektowFile = "lista_projektow.fxml";
    public static String dodajID = "dodaj";
    public static String dodajFile = "dodaj.fxml";
    public static String edytujID = "edytuj";
    public static String edytujFile = "edytuj.fxml";
    public static String nowe_kontoID = "nowe_konto";
    public static String nowe_kontoFile = "nowe_konto.fxml";

    @Override
    public void start(Stage primaryStage) throws Exception{
        Parent root = FXMLLoader.load(getClass().getResource("login.fxml"));
        ScreensController mainContainer = new ScreensController();
        mainContainer.loadScreen(Main.homeID, Main.homeFile);
        mainContainer.loadScreen(Main.lista_projektowID, Main.lista_projektowFile);
        mainContainer.loadScreen(Main.dodajID, Main.dodajFile);
        mainContainer.loadScreen(Main.edytujID, Main.edytujFile);
        mainContainer.loadScreen(Main.nowe_kontoID, Main.nowe_kontoFile);



        mainContainer.setScreen(Main.homeID);
        Group rooot = new Group();
        rooot.getChildren().addAll(mainContainer);
        Scene scene = new Scene(rooot);
        primaryStage.setScene(scene);
        primaryStage.show();
    }


    public static void main(String[] args) {
        Database db = new Database();
        db.test_connect();
        launch(args);
    }
}
