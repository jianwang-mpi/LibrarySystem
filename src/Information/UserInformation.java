package Information;

/**
 * Created by Alchemist on 2016/5/19.
 */
public class UserInformation {
    private String userID;
    private String passwd;
    private String username;
    private int debt;

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPasswd() {
        return passwd;
    }

    public UserInformation(String userID, String passwd, String username, int debt) {
        this.userID = userID;
        this.passwd = passwd;
        this.username = username;
        this.debt = debt;
    }

    public UserInformation() {
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getDebt() {
        return debt;
    }

    public void setDebt(int debt) {
        this.debt = debt;
    }
}
