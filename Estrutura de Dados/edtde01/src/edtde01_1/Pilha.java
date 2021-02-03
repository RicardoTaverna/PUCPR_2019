package edtde01_1;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Ricardo Taverna
 * função Cria_Pilha feita no construtor da classe Pilha "Pilha"
 */
public class Pilha {
    //indice do elemento no topo da lista
    private int topo;
    //armazenamento de dados
    private int dados[];
    //quantidade maxima de elementos
    private int max;

    public Pilha(int tamanho) {
        dados = new int[tamanho];
        max = tamanho;
        topo = -1;
    }


    public int getTopo() {
        return topo;
    }

    public void setTopo(int topo) {
        this.topo = topo;
    }

    public int[] getDados() {
        return dados;
    }

    public void setDados(int[] dados) {
        this.dados = dados;
    }

    public int getMax() {
        return max;
    }

    public void setMax(int max) {
        this.max = max;
    }
    
    public int topo(){
        if (!vazia()) {
            return dados[topo];
        } else {
            System.exit(1);
        }        
        return -1;
    }
    
    public boolean vazia(){
        return topo == -1;
    }
    
    public boolean cheia(){
        return topo == max -1;
    }
    
    public void empilha(char elemento){
        if (cheia()) {
            System.out.println("Lista cheia");
            System.exit(1);
        }
        
        System.out.println("Inserir: " + elemento);
        dados[++topo] = elemento;
        
    }
    
    public Integer desempilha(){
        if (vazia()) {
            System.out.println("Lista vazia");
            return null;
        }
        System.out.println("Remover " + topo());
        
        return dados[topo--];
        
    }
    public int tamanho(){
        return topo + 1;
    }
    
}
