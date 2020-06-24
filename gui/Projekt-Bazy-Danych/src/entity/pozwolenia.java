package entity;

import javax.persistence.*;

@Entity
@Table(name = "Pozwolenia")
public class pozwolenia {

    @Id @GeneratedValue
    @Column(name = "ID_Pozwolenia")
    private String ID;

    @Column(name = "Nazwa")
    private String name;

    @Column(name = "Create_Issue")
    private int create;

    @Column(name = "Edit_own_Issue")
    private int edit_own_issue;

    @Column(name = "Delete_own_Issue")
    private int del_own_issue;

    @Column(name = "Edit_any_Issue")
    private int edit_any_issue;

    @Column(name = "Delete_any_Issue")
    private int delete_any_issue;

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

    public int getCreate() {
        return create;
    }
    public void setCreate(int create) {
        this.create = create;
    }

    public int getEdit_own_issue() {
        return edit_own_issue;
    }
    public void setEdit_own_issue(int edit_own_issue) {
        this.edit_own_issue = edit_own_issue;
    }

    public int getDel_own_issue() {
        return del_own_issue;
    }
    public void setDel_own_issue(int del_own_issue) {
        this.del_own_issue = del_own_issue;
    }

    public int getEdit_any_issue() {
        return edit_any_issue;
    }
    public void setEdit_any_issue(int edit_any_issue) {
        this.edit_any_issue = edit_any_issue;
    }

    public int getDelete_any_issue() {
        return delete_any_issue;
    }
    public void setDelete_any_issue(int delete_any_issue) {
        this.delete_any_issue = delete_any_issue;
    }

}
