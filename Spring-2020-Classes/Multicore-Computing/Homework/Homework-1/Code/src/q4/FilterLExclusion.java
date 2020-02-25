package q4;

import java.util.Arrays;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;

class FilterLExclusion implements Lock {

    int N;
    int[] gate;
    int[] last;
    int l;
    int count;

    public void PetersonN(int numProc, int limit) {
        N = numProc;
        l = limit;
        count = 0;
        gate = new int[N]; //We only use gate[1]..gate[N-1]; gate[0] is unused
        Arrays.fill(gate, 0);
        last = new int[N];
        Arrays.fill(gate, 0);
    }

    public boolean requestCS(int i) {
        for(int k = 1; k < N; k++) {
            gate[i] = k;
            last[k] = i;
            for(int j = 0; j < N; j++) {
                while((j != i) &&	// There is some other process
                        (gate[j] >= k) &&	// that is ahead or at the same level
                        (last[k] == i) &&	// and I am the last to update last[k].
                        (count >= l))
                {
                    System.out.println("BLOCKED! Limit Reached!");
                    return false;
                } // Busy wait
            }
        }
        count ++;
        System.out.println("IN CS! Threads in CS = " + count);
        return true;
    }

    public void releaseCS(int i) {
        gate[i] = 0;
        if(count > 0)
            count --;
        System.out.println("Released CS. Threads in CS = " + count);
    }

    @Override
    public void lock() {

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
    public void unlock() {

    }

    @Override
    public Condition newCondition() {
        return null;
    }
}
