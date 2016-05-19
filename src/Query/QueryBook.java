package Query;

import DataBase.DataBase;
import Information.BookInformation;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Alchemist on 2016/5/19.
 */
public class QueryBook {
    private static boolean isValidBookName(String bookName){
        return true;
    }
    public static List<BookInformation> queryBookName(String bookName){
        List<BookInformation> bookList = new ArrayList<BookInformation>();
        if(!isValidBookName(bookName)){
            return null;
        }
        String sql ="SELECT * FROM book where name like '%"+bookName+"%' ";
        List<Map<String ,Object>> result = DataBase.queryDB(sql);
        if(result!=null){
            for(int i=0;i<result.size();i++){
                BookInformation bookInformation = new BookInformation();
                bookInformation.setAuthor((String) result.get(i).get("author"));
                bookInformation.setHave((Integer)result.get(i).get("have"));
                bookInformation.setId((String)result.get(i).get("id"));
                bookInformation.setName((String) result.get(i).get("name"));
                bookInformation.setPrice((String) result.get(i).get("price"));
                bookInformation.setYear((String) result.get(i).get("year"));
                bookList.add(bookInformation);
            }
        }
        return bookList;
    }
    public static BookInformation queryBookID(String bookid){
        String sql ="SELECT * FROM book where id= '"+bookid+"' ";
        List<Map<String ,Object>> result = DataBase.queryDB(sql);
        if(result!=null&&result.size()!=0){
                BookInformation bookInformation = new BookInformation();
                bookInformation.setAuthor((String) result.get(0).get("author"));
                bookInformation.setHave((Integer)result.get(0).get("have"));
                bookInformation.setId((String)result.get(0).get("id"));
                bookInformation.setName((String) result.get(0).get("name"));
                bookInformation.setPrice((String) result.get(0).get("price"));
                bookInformation.setYear((String) result.get(0).get("year"));
            return bookInformation;
        }else {

            return null;
        }
    }
    public static void updateBookHave(BookInformation bookInformation){
        String sql ="UPDATE book SET have = "+bookInformation.getHave()+" where id='"+bookInformation.getId()+"'";
        DataBase.updateDB(sql);
    }
    public static void insertBook(BookInformation bookInformation){
        BookInformation oldbookInformation = queryBookID(bookInformation.getId());
        if(oldbookInformation!=null){
            oldbookInformation.setHave(bookInformation.getHave()+1);
            updateBookHave(oldbookInformation);
        }else{
            String sql="INSERT INTO book (id,name,author,year,price,have)VALUES('"+bookInformation.getId()+"','"+bookInformation.getName()+"','"+bookInformation.getAuthor()+"','"+bookInformation.getYear()+"','"+bookInformation.getPrice()+"',1)";
            DataBase.insertDB(sql);
        }
    }
    public static void insertBook(String id,String name,String author,String price,String year){
        BookInformation bookInformation = new BookInformation();
        bookInformation.setId(id);
        bookInformation.setHave(1);
        bookInformation.setPrice(price);
        bookInformation.setName(name);
        bookInformation.setAuthor(author);
        bookInformation.setYear(year);
        insertBook(bookInformation);
    }
    public static boolean deleteBookID(String id){
        BookInformation oldBookInformation = queryBookID(id);
        if(oldBookInformation.getHave()>1){
            oldBookInformation.setHave(oldBookInformation.getHave()-1);
            updateBookHave(oldBookInformation);
            return true;
        }else if(oldBookInformation.getHave()==1){
            String sql = "DELETE FROM book WHERE id='"+oldBookInformation.getId()+"'";
            DataBase.deleteDB(sql);
            return true;
        }else{
            return false;
        }
    }
}
