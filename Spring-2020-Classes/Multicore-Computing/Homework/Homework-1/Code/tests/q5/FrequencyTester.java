package q5;

import static org.junit.Assert.*;
import org.junit.Test;
import java.util.concurrent.ExecutionException;

public class FrequencyTester {

    // Case when value appears in array 1 time
    // AND numThreads <= array.length
    @Test public void test0() throws ExecutionException, InterruptedException {
        int x = 3;
        int[] arr = {2,3,3,3,3,3,3,3,3,3,3,3,3,33,3,3,3,3,3,3,4,5,423,2342,423,4,23,23,423,7,23,3,23,2,5,11,232,32,32,32,65};
        int numThreads = 3;
        assertEquals(19, Frequency.parallelFreq(x, arr, numThreads));
    }

    // Case when value appears in array multiple times (3)
    // AND numThreads <= array.length
    @Test public void test1() throws ExecutionException, InterruptedException {
        Frequency f = new Frequency();
        int x = 2;
        int[] arr = new int[]{2, 3, 4, 5, 6, 2, 5, 2, 7};
        int numThreads = 3;
        assertEquals(3, f.parallelFreq(x, arr, numThreads));
    }

    // Case when value appears in array 0 times
    // AND numThreads <= array.length
    @Test public void test2() throws ExecutionException, InterruptedException {
        Frequency f = new Frequency();
        int x = 0;
        int[] arr = new int[]{2, 3, 4, 5, 6};
        int numThreads = 3;
        assertEquals(0, f.parallelFreq(x, arr, numThreads));
    }

    // Case when value appears in array 1 time
    // AND numThreads > array.length
    @Test public void test3() throws ExecutionException, InterruptedException {
        Frequency f = new Frequency();
        int x = 3;
        int[] arr = new int[]{2, 3, 4, 5, 6};
        int numThreads = 10;
        assertEquals(-1, f.parallelFreq(x, arr, numThreads));
    }

    // Case when value appears in array multiple times (3)
    // AND numThreads > array.length
    @Test public void test4() throws ExecutionException, InterruptedException {
        Frequency f = new Frequency();
        int x = 2;
        int[] arr = new int[]{2, 3, 4, 5, 6, 2, 5, 2, 7};
        int numThreads = 10;
        assertEquals(-1, f.parallelFreq(x, arr, numThreads));
    }

    // Case when value appears in array 0 times
    // AND numThreads > array.length
    @Test public void test5() throws ExecutionException, InterruptedException {
        Frequency f = new Frequency();
        int x = 0;
        int[] arr = new int[]{2, 3, 4, 5, 6};
        int numThreads = 10;
        assertEquals(-1, f.parallelFreq(x, arr, numThreads));
    }

    // Case when value appears in array 1 time
    // AND numThreads <= 0
    @Test public void test6() throws ExecutionException, InterruptedException {
        Frequency f = new Frequency();
        int x = 3;
        int[] arr = new int[]{2, 3, 4, 5, 6};
        int numThreads = 0;
        assertEquals(-1, f.parallelFreq(x, arr, numThreads));
    }

    // Case when value appears in array multiple times (3)
    // AND numThreads <= 0
    @Test public void test7() throws ExecutionException, InterruptedException {
        Frequency f = new Frequency();
        int x = 2;
        int[] arr = new int[]{2, 3, 4, 5, 6, 2, 5, 2, 7};
        int numThreads = -1;
        assertEquals(-1, f.parallelFreq(x, arr, numThreads));
    }

    // Case when value appears in array 0 times
    // AND numThreads <= 0
    @Test public void test8() throws ExecutionException, InterruptedException {
        Frequency f = new Frequency();
        int x = 0;
        int[] arr = new int[]{2, 3, 4, 5, 6};
        int numThreads = -5;
        assertEquals(-1, f.parallelFreq(x, arr, numThreads));
    }
}
