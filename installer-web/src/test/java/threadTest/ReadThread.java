package threadTest;

public class ReadThread extends Thread{
 String filename="H:\\test.txt";
	@Override
	public void run() {
		ReadFromFile.readFileByLines(filename);
	}
	

}
