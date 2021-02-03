import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;

public class Conjunto {

    private List<List<Integer>> tabela = new ArrayList<List<Integer>>();
    private int tamanhoTabela = 0;
    private int tamanho = 0;

    //Montagem da tabela - EX B
    //Construtor - EX E
    public Conjunto(int tamanho) {
        this.tamanho = tamanho;
        for (int i = 0; i < tamanho; i++) {
            LinkedList<Integer> lista = new LinkedList<Integer>();
            tabela.add(lista);
        }
        Random r = new Random();
        for (int ins = 0; ins < 10000; ins++){
            adiciona(r.nextInt(99999));
        }
        System.out.println();
        System.out.println(" Tabela com tamanho: " + tamanho);
        System.out.println();
    }

    //Carrega o hash padrão  - EX D
    private int calculaIndiceDaTabela(int numero){

        return numero % 10000;
    }

    //Metodo que Insere o dado na tabela - EX D
    public void adiciona(int numero) {
        if(!this.contem(numero)){
            int indice = this.calculaIndiceDaTabela(numero);
            List<Integer> lista = this.tabela.get(indice);
            lista.add(numero);
        }
    }

    public void remove(int numero) {
        if (this.contem(numero)) {
            int indice = this.calculaIndiceDaTabela(numero);
            List<Integer> lista = this.tabela.get(indice);
            lista.remove(numero);
        }
    }

    //Numero de colisões - EX B
    //Validacao se o elemento passado (chave) existe na tabela - EX Gx
    public boolean contem(int numero) {
        int indice = this.calculaIndiceDaTabela(numero);
        List<Integer> lista = this.tabela.get(indice);

        return lista.contains(numero);
    }

    public List<Integer> pegaTodas(){
        List<Integer> numero = new ArrayList<Integer>();

        for (int i = 0; i < this.tabela.size(); i++) {
            numero.addAll(this.tabela.get(i));
        }

        return numero;
    }

    public int tamanhoTabela() {
        return this.tamanhoTabela;
    }

    //mostra em tela toda a tabela - EX F
    public void imprimeTabela(){
        int index = 0;
        for(List<Integer> lista : this.tabela){
            System.out.print(index +  " [");
            for(int i = 0; i < lista.size(); i++){
                if (lista.isEmpty()){
                    System.out.println(-1);
                }else{
                    System.out.print(" " + lista.get(i)+ " ");
                }

            }
            System.out.println("]");
            index++;
        }
    }


}
