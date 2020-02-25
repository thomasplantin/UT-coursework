package q2.b;

import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.*;
import java.lang.Thread;

public class PIncrement {
    static int result;
    static LamportsFastMutex lamportsFastMutex;

    public static int parallelIncrement(int c, int numThreads) {
        result = c;
        int numOps = 120000 / numThreads;
        Thread myThreads[] = new Thread[numThreads];
        int incrementOperations[] = new int[numOps];
        lamportsFastMutex = new LamportsFastMutex(numThreads);

        for(int i = 0; i < incrementOperations.length; i++) {
            incrementOperations[i] = numOps;
        }

        for (int i = 0; i < numThreads; i++) {
            myThreads[i] = new Thread(new MyThread(i, incrementOperations[i]));
            myThreads[i].start();
        }

        for (int i = 0; i < numThreads; i++) {
            try {
                myThreads[i].join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        return result;
    }

    public static class MyThread implements Runnable {
        int id;
        int numIncrements;

        MyThread(int id, int numIncrements) {
            this.id = id;
            this.numIncrements = numIncrements;
        }

        @Override
        public void run() {
            for (int i = 0; i < numIncrements; i++) {
                lamportsFastMutex.acquire(id);
                result++;
                lamportsFastMutex.release(id);
            }
        }

    }

    public static class LamportsFastMutex {
        int N;
        AtomicInteger X, Y;
        AtomicBoolean[] flag;

        public LamportsFastMutex(int numThreads) {
            N = numThreads;
            X = new AtomicInteger(-1);
            Y = new AtomicInteger(-1);
            flag = new AtomicBoolean[N];
            for (int i = 0; i < N; i++) {
                flag[i] = new AtomicBoolean(false);
            }
        }

        public void acquire(int i) {
            while(true) {
                flag[i].set(true);
                X.set(i);
                if(Y.get() != -1) { // Splitter's left
                    flag[i].set(false);
                    while(Y.get() != -1) {
                        // Wait for Y to be -1
                    }
//                    continue;
                }
                else {
                    Y.set(i);
                    if(X.get() == i)  // Success with splitter
                        return; // Fast path
                    else {
                        flag[i].set(false);
                        for(int j = 0; j < N; j++) {
                            while(flag[j].get()) {
                                // Wait for all flags to be false
                            }
                        }
                        if(Y.get() == i)
                            return; // Slow path
                        else {
                            while(Y.get() != -1) {
                                // Wait for Y to be -1
                            }
//                            continue;
                        }
                    }
                }
            }
        }

        public void release(int i) {
            Y.set(-1);
            flag[i].set(false);
        }

    }

}