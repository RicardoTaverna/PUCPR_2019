//funcao hash
// int hash(int chave){return chave % 100} ultimos 3 digitos de um numero
// TRATAMENTO DE COLISÕES
// encadeamnento
//_chave _ListaEncadeada
import java.sql.SQLOutput;
import java.util.Scanner;
public class Main {

    public static void main(String[] args) {
        System.out.println("==============TABELA HASH=================");
        Scanner input = new Scanner(System.in);

        //Entrada do tamanho para a tabela - EX C
        System.out.println("Digite o tamanho que a tabela deve ter: ");
        int tamanho = input.nextInt();

        Conjunto conjunto = new Conjunto( tamanho);
        conjunto.adiciona(10);
        conjunto.adiciona(5);
        conjunto.adiciona(3);
        conjunto.adiciona(30);

        conjunto.imprimeTabela();

        System.out.println("================PROCURAR==================");
        System.out.println();
        System.out.println(conjunto.contem(10));

    }
}
