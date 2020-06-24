package sample;

public class Session {
    public static Session INSTANCE;

    private String userId;

    private Session(){
        if( INSTANCE != null ){
            throw new IllegalStateException("Użytkownik jest już zalogowany");
        }
    }

    public static Session getInstance(){
        if (INSTANCE == null){
            INSTANCE = new Session();
        }
        return INSTANCE;
    }

    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }
}
