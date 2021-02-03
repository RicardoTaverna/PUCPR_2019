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

public class Expressao {
    private String expressao; 
    private int qtde = 50;    
    private Pilha p = new Pilha(qtde);
    private boolean valorEx;
    
    public Expressao(String expressao) {
        this.expressao = expressao;
        qtde = expressao.length();
    }

    public String getExpressao() {
        return expressao;
    }

    public void setExpressao(String expressao) {
        this.expressao = expressao;
    }

    public Pilha getP() {
        return p;
    }

    public void setP(Pilha p) {
        this.p = p;
    }

    public int getQtde() {
        return qtde;
    }
    
    
    public void setQtde(int qtde) {
        this.qtde = qtde;
        
    }
    
    
    public void avaliaExpressao(String expressao) {
        qtde = expressao.length();
        this.expressao = expressao;
        for (int i = 0; i < qtde; i++) {
            if (expressao.charAt(i) == '[' || expressao.charAt(i) == '{' || expressao.charAt(i) == '(') {
                p.empilha(expressao.charAt(i));
            }
        }
        for (int i = 0; i < qtde; i++) {
            if (expressao.charAt(i) == ']' && (char)p.topo() == '[') {
                p.desempilha();
            }else {
                if (expressao.charAt(i) == '}' && (char)p.topo() == '{') {
                     
                }else {
                    if (expressao.charAt(i) == ')' && (char)p.topo() == '(') { 
                        if(p.desempilha() == null){
                            valorEx = false;
                        }else{
                            p.desempilha();
                        }
                       
                    }
                }
            }
        }
        System.out.println(valorEx);
        
    }
}
