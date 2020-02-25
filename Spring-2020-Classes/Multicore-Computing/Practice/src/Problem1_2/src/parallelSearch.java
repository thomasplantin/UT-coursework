package Problem1_2.src;

import java.util.Arrays;

class SearchingThread extends Thread {
    // Just printing stuff...
    public void run() {
        try {
            System.out.println("Thread " + Thread.currentThread().getId() + " is running");
        }
        catch (Exception e) {
            System.out.println(e);
        }
    }

    public static int searchFor(int x, int[] subArray, int threadNumber) {
        for(int i = 0; i < subArray.length; i++) {
            if(subArray[i] == x) {
                System.out.println("FOUND IT!");
                return threadNumber;
            }
        }
        System.out.println("NOT IN DATA...");
        return -1;
    }
}

public class parallelSearch extends Thread {

    public static int[][] sectionArray(int x, int[] A, int numThreads) {

        if(numThreads > A.length) {
            System.out.println("Number of threads (" + numThreads + ") too large for the length of the array" +
                    " (" + A.length + ")");
        }
        
        int[] piles = new int[numThreads]; // Declaring the piles. Same amount of piles as the number of threads
        // requested
        int count = 0;  // Initiating the count
        while(count < A.length) {   // Given the number of elements in your array, go through each of the piles and
            // increment the pile value
            for(int i = 0; i < numThreads; i++){
                if(count < A.length) {
                    piles[i]++;
                    count++;
                }
                else {
                    break;
                }
            }
        }

        // Create a 2D jagged array to split the main array in smaller chunks
        int[][] chunks = new int[numThreads][];
        for(int i = 0; i < piles.length; i++)
            chunks[i] = new int[piles[i]];

        // Copy the elements from the main array into the smaller chunk arrays
        int k = 0;
        for(int i = 0; i < numThreads; i++) {
            for(int j = 0; j < piles[i]; j++) {
                chunks[i][j] = A[k];
                k++;
            }
            System.out.println(Arrays.toString(chunks[i]));
        }

        return chunks;
    }

    public static void main(String[] args) {
        int x = 10;
        int numThreads = 5;
        int[] array = new int[]{4, 5, 2, 16, 3, 7, 10, 1};
        int[][] chunks = sectionArray(x, array, numThreads);
        for(int i = 0; i < chunks.length; i++) {
            SearchingThread object = new SearchingThread();
            object.start();
            System.out.println(object.searchFor(x, chunks[i], i));
        }
    }
}
