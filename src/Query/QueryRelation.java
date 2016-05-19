package Query;

import DataBase.DataBase;
import Information.RelationInformation;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Alchemist on 2016/5/19.
 */
public class QueryRelation {
    public static List<RelationInformation> queryRelationID(String userID){
        List<RelationInformation> relationList = new ArrayList<RelationInformation>();
        String sql= "SELECT * FROM relation where userid ='"+userID+"' ";
        List<Map<String,Object>> resultList = DataBase.queryDB(sql);
        if(resultList!=null){
            for(int i=0;i<resultList.size();i++){
                RelationInformation relationInformation = new RelationInformation();
                relationInformation.setBorrowID((String)resultList.get(i).get("borrowID"));
                relationInformation.setBookid((String) resultList.get(i).get("bookid"));
                relationInformation.setDay((Integer) resultList.get(i).get("day"));
                relationInformation.setUserid((String) resultList.get(i).get("userid"));
                relationList.add(relationInformation);
            }
        }
        return relationList;
    }
    public static List<RelationInformation> queryRelationBookID(String bookID){
        List<RelationInformation> relationList = new ArrayList<RelationInformation>();
        String sql= "SELECT * FROM relation where bookid ='"+bookID+"' ";
        List<Map<String,Object>> resultList = DataBase.queryDB(sql);
        if(resultList!=null){
            for(int i=0;i<resultList.size();i++){
                RelationInformation relationInformation = new RelationInformation();
                relationInformation.setBorrowID((String)resultList.get(i).get("borrowID"));
                relationInformation.setBookid((String) resultList.get(i).get("bookid"));
                relationInformation.setDay((Integer) resultList.get(i).get("day"));
                relationInformation.setUserid((String) resultList.get(i).get("userid"));
                relationList.add(relationInformation);
            }
        }
        return relationList;
    }
    public static List<RelationInformation> queryRelationAll(){
        List<RelationInformation> relationList = new ArrayList<RelationInformation>();
        String sql= "SELECT * FROM relation";
        List<Map<String,Object>> resultList = DataBase.queryDB(sql);
        if(resultList!=null){
            for(int i=0;i<resultList.size();i++){
                RelationInformation relationInformation = new RelationInformation();
                relationInformation.setBorrowID((String)resultList.get(i).get("borrowID"));
                relationInformation.setBookid((String) resultList.get(i).get("bookid"));
                relationInformation.setDay((Integer) resultList.get(i).get("day"));
                relationInformation.setUserid((String) resultList.get(i).get("userid"));
                relationList.add(relationInformation);
            }
        }
        return relationList;
    }
    public static void insertRelation(RelationInformation relationInformation){
        String sql = "INSERT INTO relation (borrowID,userid,bookid,day)VALUES( '"+relationInformation.getBorrowID()+"', '"+relationInformation.getUserid()+"','"+relationInformation.getBookid()+"',"+relationInformation.getDay()+")";
        DataBase.insertDB(sql);
    }
    public static void deleteRelation(RelationInformation relationInformation){
        String sql ="DELETE FROM relation WHERE borrowID='"+relationInformation.getBorrowID()+"'";
        DataBase.deleteDB(sql);
    }
}
