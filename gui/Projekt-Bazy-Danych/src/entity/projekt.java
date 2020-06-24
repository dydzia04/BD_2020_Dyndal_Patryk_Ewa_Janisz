package entity;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "Projekt")
public class projekt {
    @Id @GeneratedValue
    @Column(name = "ID_Projektu")
    private String ID;

    @Column(name = "Opis")
    private String description;

    @Column(name = "Czas_Modyfikacji")
    private java.sql.Timestamp modificationDateTime;

    public String getID() { return ID; }
    public void setID(String ID) { this.ID = ID; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public Timestamp getModificationDateTime() { return modificationDateTime; }
    public void setModificationDateTime(Timestamp modificationDateTime) { this.modificationDateTime = modificationDateTime; }
}
