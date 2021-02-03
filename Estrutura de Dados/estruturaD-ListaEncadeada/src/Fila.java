public class Fila {
    private Lista fila = new Lista();

    public void insereFila(int elemento){
        fila.insereUltimo(elemento);
    }

    public void removeFila(){
        fila.removeDoComeco();
    }

    public void imprimeFila(){
        fila.imprimir();
    }
}
