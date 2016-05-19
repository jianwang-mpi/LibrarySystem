package Query;

import DataBase.DataBase;
import Information.VipInformaion;

import java.util.List;
import java.util.Map;

/**
 * Created by Alchemist on 2016/5/19.
 */
public class QueryVip {
    private static boolean isValidUserID(){
        boolean result=true;
        //TO DO...还要对输入的id进行确认，防止sql注入
        return result;
    }
    public static VipInformaion queryVipID(String userID){
        VipInformaion vipInformaion = null;
        if(!isValidUserID()){
            return vipInformaion;
        }
        String sql = "SELECT * FROM vip where userID='"+userID+"' ";
        List<Map<String ,Object>> result = DataBase.queryDB(sql);
        if(result!=null&&result.size()!=0){
            vipInformaion = new VipInformaion();
            vipInformaion.setUserID(userID);
            vipInformaion.setPasswd((String) result.get(0).get("passwd"));
        }
        return vipInformaion;
    }
}
