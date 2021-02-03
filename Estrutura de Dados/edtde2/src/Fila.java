public class Fila {
    //indice do primeiro elemento
    private int primeiro;
    //indice do ultimo elemento
    private int ultimo;
    //dados
    public int[] dados;
    private int elementos;

    public Fila(int n) {
        this.elementos = n;
        dados = new int[elementos];
    }

    public int getPrimeiro() {
        return primeiro;
    }

    public void setPrimeiro(int primeiro) {
        this.primeiro = primeiro;
    }

    public int getUltimo() {
        return ultimo;
    }

    public void setUltimo(int ultimo) {
        this.ultimo = ultimo;
    }

    public int[] getDados() {
        return dados;
    }

    public void setDados(int[] dados) {
        this.dados = dados;
    }

    public boolean cheio(){
        boolean valida = false;

        if (dados[dados.length - 1] != 0){
            valida = true;
            System.out.println("Lista esta cheia");
        }else{
            System.out.println("Lista nao esta cheia");
        }
        return valida;

    }

    public boolean vazio() {
        boolean valida = false;

        for (int i = 0; i < dados.length; i++){
            if(dados[i] == 0){
                valida = true;
            }else{
                valida = false;
            }
        }
        if(valida){
            System.out.println("Lista vazia");
        }else {
            System.out.println("Lista falsa");
        }
        return valida;
    }

    public void insere(int elemento){

        for (int i = 0; i < dados.length; i++){
            if(dados[i] == 0){
                dados[i] = elemento;
                System.out.println("Elemento " + elemento +" inserido na posicao " + i );
                break;
            }

        }

    }

    public int remove() {

        for (int i = 0; i < dados.length; i++){
            if(dados[i] != 0){
                elementos = dados[i];
                System.out.println("Elemento " + dados[i] +" removidos da posição " + i );
                dados[i] = 0;

            }
        }
        return elementos;
    }

    public void imprime(){
        for (int i = 0; i < dados.length; i++ ){
            System.out.println(dados[i]);
        }
    }

}
