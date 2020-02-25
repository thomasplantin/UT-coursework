package pset1;

import static org.junit.Assert.*;
import org.junit.Test;

public class HashCodeTester {
    /*
     * P5: If two objects are equal according to the equals(Object)
     * method, then calling the hashCode method on each of
     * the two objects must produce the same integer result.
     */
// your test methods go here
    @Test public void t3_OO() {
        Object x = new Object();
        assertTrue(x.hashCode() == x.hashCode() == x.equals(x));
    }

    @Test public void t3_CC() {
        C cx = new C(1);
        assertTrue(cx.hashCode() == cx.hashCode() == cx.equals(cx));
    }

    @Test public void t3_DD() {
        D dx = new D(1, 4);
        assertTrue(dx.hashCode() == dx.hashCode() == dx.equals(dx));
    }
    //////////////////////////////////////////////////////////////
    @Test public void t3_OC() {
        Object x = new Object();
        C cx = new C(1);
        assertTrue((cx.hashCode() == x.hashCode()) == (x.equals(cx)));
    }

    @Test public void t3_OD() {
        Object x = new Object();
        D dx = new D(1, 4);
        assertTrue((dx.hashCode() == x.hashCode()) == (x.equals(dx)));
    }

    @Test public void t3_CD() {
        C cx = new C(1);
        D dx = new D(1, 4);
        assertTrue((dx.hashCode() == cx.hashCode()) == (cx.equals(dx)));
    }
    //////////////////////////////////////////////////////////////
    @Test public void t3_OCF() {
        Object x = new Object();
        C cx = new C(1);
        assertFalse((cx.hashCode() == x.hashCode()) == (x.equals(cx) == cx.equals(x)));
    }

    @Test public void t3_ODF() {
        Object x = new Object();
        D dx = new D(1, 4);
        assertFalse((dx.hashCode() == x.hashCode()) == (x.equals(dx) == dx.equals(x)));
    }

    @Test public void t3_CDF() {
        C cx = new C(1);
        D dx = new D(1, 4);
        assertFalse((cx.hashCode() == dx.hashCode()) == (dx.equals(cx) == cx.equals(dx)));
    }
}