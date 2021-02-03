public class Main {

    public static void main(String[] args) {
        System.out.println("===============FIFO==============");
        Fila novaFila = new Fila();
        novaFila.insereFila(1);
        novaFila.insereFila(2);
        novaFila.insereFila(3);
        novaFila.imprimeFila();
        novaFila.removeFila();
        novaFila.imprimeFila();
        novaFila.insereFila(4);
        novaFila.imprimeFila();
        System.out.println("=================================");
        System.out.println("===============LIFO==============");
        Pilha novaPilha = new Pilha();
        novaPilha.topo();
        novaPilha.inserePilha(1);
        novaPilha.inserePilha(2);
        novaPilha.inserePilha(3);
        novaPilha.imprimePilha();
        novaPilha.removePilha();
        novaPilha.imprimePilha();
        novaPilha.topo();
        novaPilha.inserePilha(4);
        novaPilha.imprimePilha();
        novaPilha.topo();
        System.out.println("=================================");
    }
}
