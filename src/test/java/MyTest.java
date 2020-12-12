import com.xu.pojo.User;
import com.xu.service.UserService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class MyTest extends BaseTest{
    @Autowired
    private UserService userService;

    @Test
    public void test() throws IOException {
        BufferedWriter out = new BufferedWriter(new FileWriter("runtime0.txt"));
        double startTime, endTime, usedTime;
        for(int i=0;i<=100;i++) {

            User user = new User(null, "" + i, "" + i, 0, 0);

            startTime = System.currentTimeMillis();
            userService.addUser(user);
            endTime = System.currentTimeMillis();
            usedTime = (endTime - startTime)/1000.0;
            out.write("第" + i + "次 写操作耗时： " + usedTime + "s ");

            startTime = System.currentTimeMillis();
            userService.getUserByPwd("" + i/2);
            endTime = System.currentTimeMillis();
            usedTime = (endTime - startTime) / 1000;
            out.write("读操作耗时： " + usedTime + "s\n");
        }

        out.close();
    }

    @Test()
    public void test1() throws IOException {
        BufferedWriter out = new BufferedWriter(new FileWriter("runtimeWrite.txt"));
        BufferedWriter out1 = new BufferedWriter(new FileWriter("runtimeReadIdx1.txt"));
        double startTime, endTime, usedTime;
        for(int i=0;i<=10000;i++) {

            User user = new User(null, "" + i, "" + i, 0, 0);

            startTime = System.currentTimeMillis();
            userService.addUser(user);
            endTime = System.currentTimeMillis();
            usedTime = (endTime - startTime)/1000.0;
            out.write("第" + i + "次 写操作耗时： " + usedTime + "s \n");

            if(i % 100 == 0){
                startTime = System.currentTimeMillis();
                userService.getUserByPwd("" + i/2);
                endTime = System.currentTimeMillis();
                usedTime = (endTime - startTime)/1000.0;
                out1.write("第" + i/100 + "次 读操作耗时： " + usedTime + "s \n");
            }

        }

        out.close();
        out1.close();
    }



}
