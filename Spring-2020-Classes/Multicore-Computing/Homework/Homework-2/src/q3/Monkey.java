package q3;

import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class Monkey {
    // declare the variables here
    final Lock lock;
    final Condition strongRope, changeDirection, kongSignalAll, allSignalKong;
    int maxMonkeys = 3;
    AtomicInteger monkeysOnRope, currentDirection;
    AtomicBoolean kongIsHere, kongPassing;

    public Monkey() {
        // Initialize reentrant lock
        lock = new ReentrantLock();
        strongRope = lock.newCondition();
        changeDirection = lock.newCondition();
        kongSignalAll = lock.newCondition();
        allSignalKong = lock.newCondition();
        monkeysOnRope = new AtomicInteger(0);
        currentDirection = new AtomicInteger(2);
        kongIsHere = new AtomicBoolean(false);
        kongPassing = new AtomicBoolean(false);
    }

    // A monkey calls the method when it arrives at the river bank and
    // wants to climb the rope in the specified direction (0 or 1);
    // Kong’s direction is -1.
    // The method blocks a monkey until it is allowed to climb the rope.
    public void ClimbRope(int direction) throws InterruptedException {
        lock.lock();
        try {
            // If you are Kong, set your flag to true so other monkeys know you arrived and set direction
            // to your direction
            if(direction == -1) {
                kongIsHere.set(true);
                currentDirection.set(direction);
                System.out.println("KONG IS HERE!");
            }

            // When Kong is not here and the rope is empty, set your direction
            if (monkeysOnRope.get() == 0 && !kongIsHere.get()) {
                System.out.println("Setting my direction => " + direction);
                currentDirection.set(direction);
            }

            // While Kong is here and you are a monkey, wait for him to give the signal that he passed through.
            while(kongIsHere.get() && direction != -1) {
                System.out.println("KONG IS HERE, my direction = " + direction);
                kongSignalAll.await();
                System.out.println("KONG signal received.");
                currentDirection.set(direction);
            }

            // While it is not your direction, wait for a change in direction
            while (currentDirection.get() != direction) {
                System.out.println("Not my direction, mine = " + direction + " ; theirs = " + currentDirection.get());
                changeDirection.await();
                // If the rope is free and Kong is not here, set the direction to your direction
                if(monkeysOnRope.get() == 0 && !kongIsHere.get())
                    currentDirection.set(direction);
            }

            while (monkeysOnRope.get() == maxMonkeys && direction != -1) {
                System.out.println("WAIT! Too many monkeys = " + monkeysOnRope.get() + " ; Dir = " + direction);
                strongRope.await();
                // While Kong is here, wait for him to give the signal that he passed through.
                while(kongIsHere.get()) {
                    System.out.println("KONG IS HERE, mine = " + direction + "KONG = " + currentDirection.get());
                    kongSignalAll.await();
                }
            }

            // While there is at least one monkey on the rope and you are KONG
            while (monkeysOnRope.get() > 0 && direction == -1) {
                System.out.println("KONG waiting for Others...");
                allSignalKong.await();
            }

            if(direction == -1) {
                System.out.println("kongPassing SET to true");
                kongPassing.set(true);
            }

            // Done testing
            monkeysOnRope.getAndIncrement();
            System.out.println("Adding Monkey, Total = " + monkeysOnRope.get() + ", Dir = " + direction);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            lock.unlock();
        }
    }

    // After crossing the river, every monkey calls this method which
    // allows other monkeys to climb the rope.
    public void LeaveRope() {
        lock.lock();
        try {
            monkeysOnRope.getAndDecrement();
            System.out.println("Removing Monkey, Total = " + monkeysOnRope.get());

            if(!kongIsHere.get()) {
                strongRope.signal();
                System.out.println("Rope can hold one more");
            }

            if(monkeysOnRope.get() == 0 && !kongIsHere.get()) {
                changeDirection.signalAll();
                System.out.println("Signaling direction change");
            }

            // If you are KONG retrieving your flags, set them to false and signal other monkeys
            if(kongPassing.get()) {
                kongIsHere.set(false);
                kongPassing.set(false);
                kongSignalAll.signalAll();
                System.out.println("Kong signaling others");
            }

            if(kongIsHere.get() && monkeysOnRope.get() == 0 && !kongPassing.get()) {
                System.out.println("Signaling KONG");
                allSignalKong.signal();
            }

        } finally {
            lock.unlock();
        }
    }

    /**
     * Returns the number of monkeys on the rope currently for test purpose.
     *
     * @return the number of monkeys on the rope
     *
     * Positive Test Cases:
     * case 1: when normal monkey (0 and 1) is on the rope, this value should <= 3, >= 0
     * case 2: when Kong is on the rope, this value should be 1
     */
    public int getNumMonkeysOnRope() {
        return monkeysOnRope.get();
    }

}