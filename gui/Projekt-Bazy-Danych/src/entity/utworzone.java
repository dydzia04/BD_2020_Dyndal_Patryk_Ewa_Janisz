package entity;


import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "Utworzone")
public class utworzone {
    @Id @GeneratedValue
    @Column(name = "ID_Uzytkownika")
    private String user_id;

    @Column(name = "ID_Utworzone")
    private String ID;

    @Column(name = "Czas_Utworzenia")
    private java.sql.Timestamp creation_time;

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public Timestamp getCreation_time() {
        return creation_time;
    }

    public void setCreation_time(Timestamp creation_time) {
        this.creation_time = creation_time;
    }
}
