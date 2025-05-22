public class Escopo {

    private String name = "Escopo de Instancia";
    // public static String name = "Escopo Estático"; /// Não pode usar o nome da variável de instância aqui, pois é um método estático
    public static String static_name = "Variavel Estática";

    public static void staticMethod(String name, String static_name){
        System.out.println(name); // Não se refere a variável de instância
        System.out.println(static_name); // Variavel de Bloco
        System.out.println(Escopo.static_name); // Variavel Estática
    }


    public static void escopoEstático(){
        String name = "Escopo Estático";
        System.out.println(name); // Escopo Estático

        // System.out.println(this.name); // Escopo de Instancia
        // this.name não pode ser usado aqui, pois é um método estático
    }


    public void escopoInstancia(){
        String name = "Escopo de Método";
        System.out.println(name); // Escopo de Método
        System.out.println(this.name); // Escopo de Instancia
    }


    public void escopoBloco(String name, String static_name){
        for(int i = 0; i < 1; i++){

            if(true){
                int j = 0;
                System.out.println(i);
            }

            // System.out.println(j); // j não existe aqui

            System.out.println(name); // Escopo de Método
            System.out.println(this.name); // Escopo de Instancia
            System.out.println(static_name); // Variavel de Bloco
        }
    }

    public static void main(String[] args) {
        Escopo teste_escopo = new Escopo();

        teste_escopo.escopoBloco("name", "static_name");
        teste_escopo.escopoInstancia();

        Escopo.escopoEstático();
        teste_escopo.escopoEstático(); // Pode mas não é necessário
        Escopo.staticMethod("name", "static_name");
    }
}