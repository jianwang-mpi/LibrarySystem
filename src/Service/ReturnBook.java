package Service;

import Information.BookInformation;
import Information.RelationInformation;
import Query.QueryBook;
import Query.QueryRelation;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

/**
 * Created by Alchemist on 2016/5/19.
 */
public class ReturnBook  {
    private static boolean ifOverTime(RelationInformation relationInformation) {
        boolean overtime=false;
        try {
            String time = String.valueOf(relationInformation.getDay());
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
            Date start = simpleDateFormat.parse(time);
            Date end = new Date();
            long temp = end.getTime()-start.getTime();
            long days=(temp/1000/60/60/24);
            if(days>30){
                overtime=true;
            }
        }catch (ParseException e){
            e.printStackTrace();
        }
        return overtime;
    }
    public static int returnBook(String bookid){
        int stat=0;//failure
        List<RelationInformation> relationList = QueryRelation.queryRelationBookID(bookid);
        if(relationList==null||relationList.size()==0){
            return stat;
        }
        relationList.sort(new Comparator<RelationInformation>() {
            @Override
            public int compare(RelationInformation o1, RelationInformation o2) {
                return o1.getDay()-o2.getDay();
            }
        });
        RelationInformation relationInformation = relationList.get(0);
        BookInformation bookInformation = QueryBook.queryBookID(relationInformation.getBookid());
        bookInformation.setHave(bookInformation.getHave()+1);
        QueryBook.updateBookHave(bookInformation);
        QueryRelation.deleteRelation(relationInformation);
        stat=1;
        if(ifOverTime(relationInformation)){
            stat=-1;//overtime
        }
        return stat;
    }
}
