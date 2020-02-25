package q4;

import static org.junit.Assert.*;
import org.junit.Test;

public class FilterLTester {

    // Making 3 threads contend for CS
    @Test public void test0(){
        System.out.println("TEST 0:");
        FilterLExclusion filter = new FilterLExclusion();
        filter.PetersonN(3,2);
        assertTrue(filter.requestCS(1));
        assertTrue(filter.requestCS(2));
        assertFalse(filter.requestCS(2));
    }

    // Making 3 threads contend for CS, dropping one from CS, and adding one
    @Test public void test1(){
        System.out.println("\nTEST 1:");
        FilterLExclusion filter = new FilterLExclusion();
        filter.PetersonN(3,2);
        assertTrue(filter.requestCS(1));
        assertTrue(filter.requestCS(2));
        assertFalse(filter.requestCS(2));
        filter.releaseCS(2);
        assertTrue(filter.requestCS(2));
    }

    // Making 6 threads contend for CS, dropping one from CS, and adding one
    @Test public void test2(){
        System.out.println("\nTEST 2:");
        FilterLExclusion filter = new FilterLExclusion();
        filter.PetersonN(3,2);
        assertTrue(filter.requestCS(1));
        assertTrue(filter.requestCS(2));
        assertFalse(filter.requestCS(1));
        assertFalse(filter.requestCS(2));
        assertFalse(filter.requestCS(1));
        assertFalse(filter.requestCS(2));
        filter.releaseCS(2);
        assertTrue(filter.requestCS(2));
    }

}
