import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class FifoLock {

    final Lock lock;
    final Condition cond;
    AtomicInteger ticketNumber;
    AtomicInteger turn;

    public FifoLock() {
        lock = new ReentrantLock();
        cond = lock.newCondition();
        ticketNumber = new AtomicInteger(0);
        turn = new AtomicInteger(0);
    }

    public int getTicket() {
        return ticketNumber.getAndIncrement();
    }

    public void requestCS(int ticketNumber) {
        lock.lock();
        try {
            while(turn.get() != ticketNumber)
                cond.await();
            System.out.println(ticketNumber + " IN CS");
        } catch (InterruptedException e) {
            e.printStackTrace();
        } finally {
            lock.unlock();
        }
    }

    public void releaseCS() {
        System.out.println("OUT OF CS");
        turn.getAndIncrement();
        cond.signalAll();
    }


    public static void main(String[] args) throws InterruptedException {
        int n = 1000;
        FifoLock myFifo = new FifoLock();
        Thread[] threads = new Thread[n];
        for(int i = 0; i < n; i++) {
            threads[i] = new Thread(new Threads(myFifo));
            threads[i].start();
            Thread.sleep(1);
        }
    }

    static class Threads implements Runnable {

        private FifoLock myFifo;

        Threads(FifoLock myFifo) {
            this.myFifo = myFifo;
        }

        @Override
        public void run() {
            try {
                myFifo.requestCS(myFifo.getTicket());
            }
            finally {
                myFifo.releaseCS();
            }
        }
    }

}
