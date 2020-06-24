package entity;


import javax.persistence.*;


@Entity
@Table(name = "Typ_Zgloszenia")
public class typ_zgloszenia {
    @Id @GeneratedValue
    @Column(name = "ID_Typ")
    private String ID;

    @Column(name = "Nazwa")
    private String name;

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
