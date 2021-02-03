    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edtde01_1;

/**
 *
 * @author Ricardo Taverna
 */
public class Edtde01 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
    
        /*
        Pilha pilha = new Pilha(5);
        pilha.empilha(1);
        pilha.empilha(2);
        pilha.empilha(3);
        if (pilha.cheia()) {
            System.out.println("Pilha esta cheia");
        }
        
        if (pilha.vazia()) {
            System.out.println("Pilha esta vazia");
        }
        pilha.topo();
        pilha.desempilha();
        */
        String expres1 = "((1+5)*)56+12)"; 
        Expressao exp = new Expressao(expres1);
        exp.avaliaExpressao(expres1);
    }
    
}
