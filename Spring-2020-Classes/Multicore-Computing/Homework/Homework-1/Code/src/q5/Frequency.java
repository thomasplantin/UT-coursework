package q5;

import java.util.concurrent.Callable;
import java.util.concurrent.FutureTask;

public class Frequency implements Callable<Integer> {

    // Mandatory override of the call object.
    @Override
    public Integer call() throws Exception {
        return null;
    }

    public static int parallelFreq(int x, int[] A, int numThreads) {
        // Returns the number of times an integer x appears in array A.

        if(numThreads <= 0)
            return -1;

        if(numThreads > A.length)
            numThreads = A.length;

        int[] piles = new int[numThreads]; // Declaring the piles. Same amount of piles as the number of threads
        // requested
        int pileCount = 0;  // Initiating the count
        while(pileCount < A.length) {   // Given the number of elements in your array, go through each of the piles and
            // increment the pile value
            for(int i = 0; i < numThreads; i++){
                if(pileCount < A.length) {
                    piles[i]++;
                    pileCount++;
                }
                else {
                    break;
                }
            }
        }

        // Create a 2D jagged array to split the main array in smaller chunks
        int [][] chunks = new int[numThreads][];
        for(int i = 0; i < piles.length; i++)
            chunks[i] = new int[piles[i]];

        // Copy the array into the sub arrays
        int k = 0;
        for(int i = 0; i < numThreads; i++) {
            for(int j = 0; j < piles[i]; j++) {
                chunks[i][j] = A[k];
                k++;
            }
            // int theThread = i+1;
            // Optional: print out each thread array
            // System.out.println("Thread " + theThread + " = " + Arrays.toString(chunks[i]));
        }

        // Create the threads
        FutureTask[] workingThreads = new FutureTask[numThreads];
        for(int i = 0; i < numThreads; i++) {
            Callable callable = new CallableCounter(chunks[i], x);
            workingThreads[i] = new FutureTask(callable);
            Thread t = new Thread(workingThreads[i]);
            t.start();
        }

        int totalCount = 0;  // Declare the total count
        for(int i = 0; i < numThreads; i++) {
            try{
                totalCount = totalCount + (Integer) workingThreads[i].get();    // Add the thread count to the total count
            }
            catch(Exception e){

            }

        }

        return totalCount;
    }

    public static class CallableCounter implements Callable<Integer> {
        int count = 0;

        // Mandatory override of the call object.
        @Override
        public Integer call() throws Exception {
            return count;
        }

        public CallableCounter(int[] subArray, int x) {
            for (int value : subArray) {
                if (value == x)
                    this.count++;
            }
        }
    }
}