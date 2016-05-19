package Service;

import Information.BookInformation;
import Information.RelationInformation;
import Query.QueryBook;
import Query.QueryRelation;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Alchemist on 2016/5/19.
 */
public class BorrowBook {
    public static boolean borrowBook(String userID,String bookID){
        BookInformation bookInformation = QueryBook.queryBookID(bookID);
        if(bookInformation.getHave()>=1){
            bookInformation.setHave(bookInformation.getHave()-1);
            QueryBook.updateBookHave(bookInformation);
            RelationInformation relationInformation = new RelationInformation();
            relationInformation.setBorrowID(String.valueOf(new Date().getTime()));
            relationInformation.setUserid(userID);
            relationInformation.setBookid(bookID);
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
            relationInformation.setDay(Integer.parseInt(simpleDateFormat.format(new Date())));
            QueryRelation.insertRelation(relationInformation);
            return true;
        }
        return  false;
    }
}
