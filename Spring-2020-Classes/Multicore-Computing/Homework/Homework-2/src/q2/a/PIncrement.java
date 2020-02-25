package q2.a;

// CLH Queue Lock Algorithm

import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.*;
import java.lang.Thread;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;

public class PIncrement {
    static int result;
    static CLHLock clhLock;

    public static int parallelIncrement(int c, int numThreads) {
        result = c;
        int numOps = 120000 / numThreads;
        Thread myThreads[] = new Thread[numThreads];
        int incrementOperations[] = new int[numOps];
        clhLock = new CLHLock();

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
                clhLock.lock();
                try {
                    result++;
                } finally {
                    clhLock.unlock();
                }
            }
        }

    }

    public static class CLHLock implements Lock {
        class Node {
            boolean locked;
        }
        AtomicReference<Node> tailNode;
        ThreadLocal<Node> myNode;
        ThreadLocal<Node> pred;

        public CLHLock() {
            tailNode = new AtomicReference<Node>(new Node());
            tailNode.get().locked = false;
            myNode = new ThreadLocal<Node>() {
                protected Node initialValue() {
                    return new Node();
                }
            };
            pred = new ThreadLocal<Node>();
        }

        @Override
        public void lock() {
            myNode.get().locked = true;
            pred.set(tailNode.getAndSet(myNode.get()));
            while(pred.get().locked) {
                Thread.yield(); // Busy Wait
            }
        }

        @Override
        public void unlock() {
            myNode.get().locked = false;
            myNode.set(pred.get()); // Resetting predecessor node for future use
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
