public class Pilha {
    private Lista pilha = new Lista();

    public void inserePilha(int elemento){
        pilha.inserePrimeiro(elemento);
    }

    public void removePilha(){
        pilha.removeDoComeco();
    }

    public void imprimePilha(){
        pilha.imprimir();
    }

    public int topo(){
        int elemento = (int) pilha.pega(0);
        System.out.println("Topo: " + elemento);
        return elemento;
    }
}
