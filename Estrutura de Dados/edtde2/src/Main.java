public class Main {

    public static void main(String[] args) {

        Fila fila1 = new Fila(3);
        Fila fila2 = new Fila(3);
        fila1.insere(1);
        fila1.insere(4);
        fila1.insere(5);
        fila2.insere(1);
        fila2.insere(2);
        fila2.insere(3);

        Merge domerge = new Merge(fila1, fila2);

    }
}
