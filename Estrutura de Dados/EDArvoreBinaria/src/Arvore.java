public class Arvore {

    public Node root;


    public Node getRoot() {
        return root;
    }

    public void setRoot(Node root) {
        this.root = root;
    }



    public void vazia(){
        if (root == null) {
            System.out.println("Arvore vazia");
        }
    }

    public Node addRecursivo(Node atual, int valor){
        if (atual == null){
            return new Node(valor);
        }

        if (valor < atual.valor){
            atual.esquerda = addRecursivo(atual.esquerda, valor);
            System.out.println("add esquerda");
        }else if (valor >= atual.valor){
            atual.direita = addRecursivo(atual.direita, valor);
            System.out.println("add direita");
        }else{
            return atual;
        }
        return atual;
    }

    public int altura(Node no){
        if (no == null){
            return -1;
        }
        int esq = altura(no.esquerda);
        int dir = altura(no.direita);
        if(esq > dir)
            return 1 + esq;
        return 1 + dir;
    }

    public Node buscar(int elemento){
        Node atual = root;
        while(atual != null && (int)atual.getValor() != elemento){
            if((int)atual.getValor() > elemento)
                atual = atual.getEsquerda();
            else
                atual = atual.getDireita();
        }
        return null;
    }

}
