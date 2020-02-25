package q2.c;

import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.*;
import java.lang.Thread;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;

public class PIncrement {
    static int result;
    static AndersonLock andersonLock;

    public static int parallelIncrement(int c, int numThreads) {
        result = c;
        int numOps = 120000 / numThreads;
        Thread myThreads[] = new Thread[numThreads];
        int incrementOperations[] = new int[numOps];
        andersonLock = new AndersonLock(numThreads);

        for(int i = 0; i < incrementOperations.length; i++) {
            incrementOperations[i] = numOps;
        }

        int remainingIncrements = 1200000 % numThreads;
        if (remainingIncrements != 0) {
            int j = 0;
            for (int i = 0; i < remainingIncrements; i++) {
                incrementOperations[j]++;
                if (j >= numThreads) {
                    j = 0;
                } else {
                    j++;
                }
            }
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
                andersonLock.lock();
                try {
                    result++;
                } finally {
                    andersonLock.unlock();
                }
            }
        }

    }

    public static class AndersonLock implements Lock {
        int N;
        AtomicInteger tailSlot;
        boolean[] Available;
        ThreadLocal<Integer> mySlot;

        public AndersonLock(int n) {
            N = n;
            tailSlot = new AtomicInteger(0);
            Available = new boolean[N];
            mySlot = new ThreadLocal<Integer>() {
                protected Integer initialValue() {
                    return 0;
                }
            };
            Available[0] = true;
            for(int i=1; i < N; i++)
                Available[i] = false;
        }

        @Override
        public void lock() {
            mySlot.set(tailSlot.getAndIncrement() % N);
            while(!Available[mySlot.get()]) {

            }
        }

        @Override
        public void unlock() {
            Available[mySlot.get()] = false;
            Available[(mySlot.get()+1) % N] = true;
        }

        @Override
        public void lockInterruptibly() throws InterruptedException {

        }

        @Override
        public boolean tryLock() {
            return false;
        }

        @Override
        public boolean tryLock(long time, TimeUnit unit) throws InterruptedException {
            return false;
        }

        @Override
        public Condition newCondition() {
            return null;
        }

    }

}