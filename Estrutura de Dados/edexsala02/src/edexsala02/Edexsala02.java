/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edexsala02;

/**
 *
 * @author taver
 */
public class Edexsala02 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        // TODO code application logic here
        int array[] = new int[5];
        int count[] = new int[5];
        array[0] = 1;
        array[1] = 2;
        array[2] = 3;
        array[3] = 3;
        array[4] = 5;
        int temp1, temp2;
        int moda = 0;
        for(int i = 0; i < array.length; i++){
            count[i] = 0;
            temp1 = array[i];
            for(int j = 0; j < array.length; j++){
                temp2 = array[j];
                if (temp1 == temp2) {
                    count[i] = count [i] + 1;
                }
            }          
        }
        
        for(int i = 0; i < count.length; i++){
            for(int j = 0; j < count.length; j++){
                if (count[i] > count[j]) {
                    moda = array[i];
                }
            }
        }
        System.out.println("A moda é " + moda);
    }
    
}
