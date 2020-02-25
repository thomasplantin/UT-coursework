package com.company;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class Main {
    static boolean positive(int[] arr) {
        // precondition: arr != null
        // postcondition: returns true iff all elements of arr are positive, i.e., > 0
        boolean result = true;
        for (int x: arr) {
            if (x < 0) {
                result = false;
                break;
            }
        }
        return result;
    }

    @Test
    public void noFaultExec() {
        assertTrue(positive(new int[] {1, 3, 4}));
    }

    @Test
    public void faultExecAndErrorButNoFailure() {
        assertTrue(positive(new int[] {0, 1, 2}));
    }

    @Test
    public void failure() {
        assertFalse(positive(new int[]{0, 1, 3}));
    }

}
