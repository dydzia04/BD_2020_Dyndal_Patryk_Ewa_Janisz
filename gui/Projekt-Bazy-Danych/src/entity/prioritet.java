package entity;


import javax.persistence.*;


@Entity
@Table(name = "Prioritet")
public class prioritet {
    @Id @GeneratedValue
    @Column(name = "ID_Prioritet")
    private String ID;

    @Column(name = "Typ")
    private String type;

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
