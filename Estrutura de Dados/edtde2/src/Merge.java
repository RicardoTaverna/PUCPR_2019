public class Merge {
    Fila fila1;
    Fila fila2;
    Fila filaFinal;

    int tamanho = fila1.dados.length + fila2.dados.length;

    int aux;

    public Merge(Fila fila1, Fila fila2) {
        this.fila1 = fila1;
        this.fila2 = fila2;
        filaFinal = new Fila(tamanho);

    }

    public void doMerge(){

    }

}
