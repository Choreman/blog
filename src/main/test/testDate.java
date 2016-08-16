import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 测试时间格式
 */
public class testDate {
    public static void main(String args[]) {
        String timestamp = "Mon Jul 14 20:47:16 CST 1997";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = simpleDateFormat.format(timestamp);
        System.out.println(date);
    }
}
