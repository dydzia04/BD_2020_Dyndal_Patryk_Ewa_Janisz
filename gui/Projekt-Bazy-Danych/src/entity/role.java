package entity;


import javax.persistence.*;

@Entity
@Table(name = "Pozwolenia")
public class role {
    @Id @GeneratedValue
    @Column(name = "ID_Uzytkownika")
    private String user_id;

    @Column(name = "ID_Pozwolenia")
    private String permit_id;

    public String getUser_id() {
        return user_id;
    }
    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getPermit_id() {
        return permit_id;
    }
    public void setPermit_id(String permit_id) {
        this.permit_id = permit_id;
    }
}
