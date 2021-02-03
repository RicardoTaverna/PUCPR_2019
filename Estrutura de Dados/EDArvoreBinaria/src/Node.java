public class Node {

    Node esquerda;
    Node direita;
    int valor;


    public Node(int valor) {
        this.valor = valor;
        esquerda = null;
        direita = null;
    }

    public Node getEsquerda() {
        return esquerda;
    }

    public void setEsquerda(Node esquerda) {
        this.esquerda = esquerda;
    }

    public Node getDireita() {
        return direita;
    }

    public void setDireita(Node direita) {
        this.direita = direita;
    }

    public Object getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }
}
