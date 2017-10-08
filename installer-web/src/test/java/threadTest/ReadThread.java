package threadTest;

public class ReadThread extends Thread{
 String filename="F:\\test.txt";
	@Override
	public void run() {
		ReadFromFile.readFileByChars(filename);
	}
	

}
