package entity;


import javax.persistence.*;
import java.sql.Timestamp;


@Entity
@Table(name = "Zamkniete")
public class zamkniete {
    @Id @GeneratedValue
    @Column(name = "ID_Zamkniete")
    private String close_id;

    @Column(name = "ID_Uzytkownika")
    private String user_id;

    @Column(name = "Czas_Zamkniecia")
    private java.sql.Timestamp close_time;

    public String getClose_id() {
        return close_id;
    }
    public void setClose_id(String close_id) {
        this.close_id = close_id;
    }

    public String getUser_id() {
        return user_id;
    }
    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public Timestamp getClose_time() {
        return close_time;
    }
    public void setClose_time(Timestamp close_time) {
        this.close_time = close_time;
    }
}
