/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edexsala01;

/**
 *
 * @author taver
 */
public class Edexsala01 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        int array[] = new int[5];
        int temp = 0;
        int media;
        for(int i = 0; i < array.length; i++){
            temp = temp + array[i];
            System.out.println(temp);
        }
        media = temp/array.length;
        System.out.println(media);
    }
    
}
