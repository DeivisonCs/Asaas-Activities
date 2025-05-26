public class Classe { // A classe pública deve ter o mesmo nome do arquivo
    
}

public class Classe2 { // Não posso ter mais de uma classe pública no mesmo arquivo
    
}

class Classe3 { // Quando não explicito o modificador de acesso, a classe é package-private (ou seja, só pode ser acessada dentro do mesmo pacote)
    
}

interface Classda { // Não posso declara uma interface com o mesmo nome de uma classe do arquvo
    String asd ="dsad"; // Variável de interface é sempre pública, estática e final, mesmo que de forma implícita
}