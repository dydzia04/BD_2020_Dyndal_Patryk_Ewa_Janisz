package entity;


import javax.persistence.*;

@Entity
@Table(name = "Zarzadzanie_projektem")
public class zarzadzanie_projektem {
    @Id @GeneratedValue
    @Column(name = "ID_Uzytkownika")
    private String user_id;

    @Column(name = "ID_Projektu")
    private String project_id;

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getProject_id() {
        return project_id;
    }

    public void setProject_id(String project_id) {
        this.project_id = project_id;
    }
}
