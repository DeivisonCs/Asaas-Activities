package fileSearch;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;


public class WordFileSearch implements Runnable {

    private String filePath;
    private String name;


    public WordFileSearch(String filePath, String name) {
        this.filePath = filePath;
        this.name = name;
    }


    @Override
    public void run() {
        try{
            Scanner fileScanner = new Scanner(new File(this.filePath));
            

            int foundAtLine = searchInFile(fileScanner);

            if(foundAtLine != -1)
                System.out.println(this.name + " found at line " + foundAtLine + " in " + this.filePath);


            fileScanner.close();
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    private int searchInFile(Scanner fileScanner) {
        int line = 1;

        while(fileScanner.hasNextLine()){
            String lineContent = fileScanner.nextLine();

            if(lineContent.toLowerCase().equals(this.name.toLowerCase()))
                return line;

            line++;
        }

        return -1;
    } 
}
