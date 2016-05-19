package Service;

import Information.UserInformation;
import Query.QueryUser;

/**
 * Created by Alchemist on 2016/5/19.
 */
public class ChangeUserInformation {
    public static void changeUsername(String username,String userID){
        UserInformation userInformation = QueryUser.queryUserID(userID);
        userInformation.setUsername(username);
        QueryUser.updateUser(userInformation);
    }
    public static void changePassword(String passwd,String userID){
        UserInformation userInformation = QueryUser.queryUserID(userID);
        userInformation.setPasswd(passwd);
        QueryUser.updateUser(userInformation);
    }
}
