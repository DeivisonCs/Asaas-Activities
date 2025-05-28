package fileSearch;

public class SearchMain {

    public static void main(String[] args) {
        String[] pathsName = {"assinaturas1.txt", "assinaturas2.txt", "autores.txt"};
        String[] namesToSearch = {"Klaus Marquardt", "Glenn Vanderburg", "Jeff Sutherland"};

        // It looks dangerous as f**k, take care of your processor
        for(String name : namesToSearch){
            for(String path : pathsName){
                Thread searchFileThread = new Thread(new WordFileSearch(path, name));
                searchFileThread.start();
            }
        }
    }
}
