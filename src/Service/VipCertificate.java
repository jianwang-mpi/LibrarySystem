package Service;

import Information.VipInformaion;
import Query.QueryVip;

/**
 * Created by Alchemist on 2016/5/19.
 */
public class VipCertificate {
    public static boolean vipCertificate(String userID,String passwd){
        VipInformaion vipInformaion = QueryVip.queryVipID(userID);
        if(vipInformaion!=null&&vipInformaion.getPasswd().equals(passwd)){
            return true;
        }
        return false;
    }
}
