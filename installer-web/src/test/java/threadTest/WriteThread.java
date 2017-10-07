package threadTest;

public class WriteThread extends Thread {
	 String filename="F:\\test.txt";
	@Override
	public void run() {
		// TODO Auto-generated method stub
	while(true) {
		  java.util.Random r=new java.util.Random(10); 
		AppendToFile.appendMethodA(filename, String.valueOf(r.nextInt()));
	}
	}

}
