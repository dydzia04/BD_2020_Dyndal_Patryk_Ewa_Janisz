package entity;

import javax.persistence.*;

@Entity
@Table(name = "Uzytkownik")
public class uzytkownik {
    @Id
    @GeneratedValue
    @Column(name = "ID_Uzytkownika")
    private String ID;

    @Column(name = "Imie_Nazwisko")
    private String firstLastName;

    @Column(name = "Nazwa_Wyswietlana")
    private String nick;

    @Column(name = "Email")
    private String email;

    @Column(name = "Zezwol_na_powiadomienia_email")
    private int allowNewsletter;

    public String getID() { return ID; }
    public void setID(String ID) { this.ID = ID; }

    public String getFirstLastName() { return firstLastName; }
    public void setFirstLastName(String firstLastName) { this.firstLastName = firstLastName; }

    public String getNick() { return nick; }
    public void setNick(String nick) { this.nick = nick; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public int getAllowNewsletter() { return allowNewsletter; }
    public void setAllowNewsletter(int allowNewsletter) { this.allowNewsletter = allowNewsletter; }
}
