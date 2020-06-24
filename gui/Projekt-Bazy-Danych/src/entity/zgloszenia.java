package entity;


import javax.persistence.*;


@Entity
@Table(name = "Zgloszenia")
public class zgloszenia {
    @Id @GeneratedValue
    @Column(name = "ID_Zgloszenia")
    private String ID;

    @Column(name = "Tytul")
    private String title;

    @Column(name = "Opis")
    private String description;

    @Column(name = "ID_Typ")
    private String type_id;

    @Column(name = "ID_Prioritet")
    private String priority_id;

    @Column(name = "ID_Utworzone")
    private String create_id;

    @Column(name = "ID_Zamkniete")
    private String close_id;

    @Column(name = "Podsumowanie")
    private String summary;

    @Column(name = "ID_Projektu")
    private String project_id;

    @Column(name = "ID_Tworcy")
    private String author_id;

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getType_id() {
        return type_id;
    }

    public void setType_id(String type_id) {
        this.type_id = type_id;
    }

    public String getPriority_id() {
        return priority_id;
    }

    public void setPriority_id(String priority_id) {
        this.priority_id = priority_id;
    }

    public String getCreate_id() {
        return create_id;
    }

    public void setCreate_id(String create_id) {
        this.create_id = create_id;
    }

    public String getClose_id() {
        return close_id;
    }

    public void setClose_id(String close_id) {
        this.close_id = close_id;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getProject_id() {
        return project_id;
    }

    public void setProject_id(String project_id) {
        this.project_id = project_id;
    }

    public String getAuthor_id() {
        return author_id;
    }

    public void setAuthor_id(String author_id) {
        this.author_id = author_id;
    }
}
