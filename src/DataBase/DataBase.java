package DataBase;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Alchemist on 2016/5/19.
 */
public class DataBase {
    final static String driverName = "com.mysql.jdbc.Driver"; //驱动名称
    static final String DBUser = "root"; //mysql用户名
    static final String DBPasswd = "wangjian"; //mysql密码
    static final String DBName = "book"; //数据库名
    static final String MySQLServer = "localhost"; //数据库名
    static final String MySQLServerPort = "3306"; //数据库名
    public static List<Map<String,Object>> queryDB(String sql){
        Connection conn=null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Map<String,Object>> resultList = new ArrayList<Map<String, Object>>();
        String url = "jdbc:mysql://"+MySQLServer+":"+MySQLServerPort+"/" + DBName;
        try{
            Class.forName(driverName);
            conn = DriverManager.getConnection(url,DBUser,DBPasswd);
            preparedStatement = conn.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
            while(resultSet.next()){
                Map<String,Object> column = new HashMap<String, Object>();
                for(int i=1;i<=resultSetMetaData.getColumnCount();i++){
                    column.put(resultSetMetaData.getColumnName(i),resultSet.getObject(i));
                }
                if(column.size()!=0)
                    resultList.add(column);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            try{
                preparedStatement.close();
                conn.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return resultList;
    }
    public static void updateDB(String sql){
        Connection conn=null;
        PreparedStatement preparedStatement = null;
        String url = "jdbc:mysql://"+MySQLServer+":"+MySQLServerPort+"/" + DBName;
        try{
            Class.forName(driverName);
            conn = DriverManager.getConnection(url,DBUser,DBPasswd);
            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            try{
                preparedStatement.close();
                conn.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    }
    public static void insertDB(String sql){
        updateDB(sql);
    }
    public static void deleteDB(String sql){
        updateDB(sql);
    }
}
