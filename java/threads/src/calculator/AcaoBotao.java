package calculator;

import java.math.BigInteger;

import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

import javax.swing.JLabel;
import javax.swing.JTextField;

public class AcaoBotao implements ActionListener {

    private JTextField primeiro;
    private JTextField segundo;
    private JLabel resultado;

    public AcaoBotao(JTextField primeiro, JTextField segundo, JLabel resultado) {
        this.primeiro = primeiro;
        this.segundo = segundo;
        this.resultado = resultado;
    }

    @Override
    public void actionPerformed(ActionEvent e) {

        Runnable operation = new TarefaMultiplicacao(primeiro, segundo, resultado);
        Thread multiplicationThread = new Thread(operation, "Multiplication");

        multiplicationThread.start();
    }
}