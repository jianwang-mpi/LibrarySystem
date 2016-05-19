package Query;

import DataBase.DataBase;
import Information.UserInformation;

import java.util.List;
import java.util.Map;

/**
 * Created by Alchemist on 2016/5/19.
 */
public class QueryUser {
    private static boolean isValidUserID(){
        boolean result=true;
        //TO DO...还要对输入的id进行确认，防止sql注入
        return result;
    }
    public static UserInformation queryUserID(String userID){

        UserInformation userInformation = null;
        if(!isValidUserID()){
            return userInformation;
        }
        String sql = "SELECT * FROM user where userID='"+userID+"' ";
        List<Map<String ,Object>> result = DataBase.queryDB(sql);
        if(result!=null&&result.size()!=0){
            userInformation = new UserInformation();
            userInformation.setUserID(userID);
            userInformation.setPasswd((String) result.get(0).get("passwd"));
            userInformation.setUsername((String) result.get(0).get("username"));
            userInformation.setDebt((Integer) result.get(0).get("debt"));
        }
        return userInformation;
    }
    public static void updateUser(UserInformation userInformation){
        String sql ="UPDATE user SET username='"+userInformation.getUsername()+"',passwd='"+userInformation.getPasswd()+"' where userID='"+userInformation.getUserID()+"'";
        DataBase.updateDB(sql);
    }
    public static void updateUser(String userID,String passwd,String username,int debt){
        UserInformation userInformation = new UserInformation();
        userInformation.setDebt(debt);
        userInformation.setUsername(username);
        userInformation.setPasswd(passwd);
        userInformation.setUserID(userID);
        updateUser(userInformation);
    }
    public static boolean insertUser(UserInformation userInformation){
        UserInformation old = queryUserID(userInformation.getUserID());
        if(old!=null){
            return false;
        }else{
            String sql = "INSERT INTO user (userID,passwd,username,debt)VALUES('"+userInformation.getUserID()+"','"+userInformation.getPasswd()+"','"+userInformation.getUsername()+"',0)";
            DataBase.insertDB(sql);
            return true;
        }
    }
    public static boolean insertUser(String userID,String passwd,String username){
        UserInformation userInformation = new UserInformation(userID,passwd,username,0);
        return insertUser(userInformation);
    }
}
