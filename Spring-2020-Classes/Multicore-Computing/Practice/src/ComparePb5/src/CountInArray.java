package ComparePb5.src;

import java.util.Arrays;
import java.util.Random;

public class CountInArray {

    public static void main(String[] args) {
        int x = 4;
        int count = 0;
        int[] array = new int[900];
        Random rd = new Random();
        for(int i = 0; i < array.length; i++) {
            array[i] = rd.nextInt(x*2 + 1);
        }

        for (int value : array) {
            if (value == x)
                count++;
        }

        System.out.println(count);

    }

}
