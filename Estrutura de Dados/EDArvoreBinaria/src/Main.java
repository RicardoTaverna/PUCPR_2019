public class Main {

    public static void main(String[] args) {
        //Premissas
        //Arvore vazia cria arvore com um no
        //Adiciona no
        //Enquanto maior ou igual adiciona a esquerda
        //Enquanto menor adiciona a direita

        //formula balanceamento
        //altura(node.getEsquerda))-altura(node.getDireita))

        System.out.println("=============Arvore Binaria===============");

        Arvore arvore = new Arvore();
        Node raiz = new Node(5);

        arvore.setRoot(raiz);
        arvore.vazia();
        arvore.addRecursivo(raiz, 7);
        arvore.addRecursivo(raiz, 8);
        arvore.addRecursivo(raiz, 6);
        System.out.println(arvore.altura(raiz));
        System.out.println(arvore.buscar(7));


    }



}
