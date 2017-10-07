package threadTest;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.Timer;

/**
 * 同时读写文件测试
 * @author Administrator
 *
 */
public class ThreadTest {
	public static void main(String[] args) {
	
		   Runnable runnable = new Runnable() {
	            public void run() {    
	            	 String filename="F:\\test.txt";
	            	AppendToFile.appendMethodA(filename, "YES      ");
	            }
		   };
	        ScheduledExecutorService service = Executors
	                .newSingleThreadScheduledExecutor();
	        // 第二个参数为首次执行的延时时间，第三个参数为定时执行的间隔时间
	        service.scheduleAtFixedRate(runnable, 1,3, TimeUnit.SECONDS);
	      
	        
			   Runnable runnable1 = new Runnable() {
		            public void run() {    
		           	 String filename="F:\\test.txt";
		 	        ReadFromFile.readFileByChars(filename);
		            }
			   };
		        ScheduledExecutorService service1 = Executors
		                .newSingleThreadScheduledExecutor();
		        // 第二个参数为首次执行的延时时间，第三个参数为定时执行的间隔时间
		        service1.scheduleAtFixedRate(runnable1, 1,1, TimeUnit.SECONDS);
	 
}
}
