package pset1;

import static org.junit.Assert.*;
import org.junit.Test;

public class EqualsTester {
    /*
     * P1: For any non-null reference value x, x.equals(null) should return false.
     */
// your test methods for P1 go here
    @Test public void t1() {
        assertFalse(new Object().equals(null));
    }

    @Test
    public void t1C() {
        C c = new C(1);
        assertFalse(c.equals(null));
    }

    @Test
    public void t1D() {
        D d = new D(1, 4);
        assertFalse(d.equals(null));
    }

    /*
     * P2: It is reflexive: for any non-null reference value x, x.equals(x)
     * should return true.
     */

// your test methods for P2 go here
    @Test public void t2() {
        Object x = new Object();
        assertTrue(x.equals(x));
        
    }

    @Test public void t2C() {
        C c = new C(1);
        assertTrue(c.equals(c));
    }

    @Test public void t2D() {
        D d = new D(1, 4);
        assertTrue(d.equals(d));
    }
    /*
     * P3: It is symmetric: for any non-null reference values x and y, x.equals(y)
     * should return true if and only if y.equals(x) returns true.
     */
// your test methods for P3 go here
    @Test public void t3_OO() {
        Object x = new Object();
        Object y = x;
        assertTrue(x.equals(y) == y.equals(x));
    }

    @Test public void t3_CC() {
        C cx = new C(1);
        C cy = cx;
        assertTrue(cx.equals(cy) == cy.equals(cx));
    }

    @Test public void t3_DD() {
        D dx = new D(1, 4);
        D dy = dx;
        assertTrue(dx.equals(dy) == dy.equals(dx));
    }
//////////////////////////////////////////////////////////////
    @Test public void t3_OC() {
        Object x = new Object();
        C cx = new C(1);
        assertTrue(x.equals(cx) == cx.equals(x));
    }

    @Test public void t3_OD() {
        Object x = new Object();
        D dx = new D(1, 4);
        assertTrue(x.equals(dx) == dx.equals(x));
    }

    @Test public void t3_CD() {
        C cx = new C(1);
        D dx = new D(1, 4);
        assertTrue(cx.equals(dx) == dx.equals(cx));
    }
//////////////////////////////////////////////////////////////

    @Test public void t3_OCF() {
        Object x = new Object();
        C cx = new C(1);
        assertFalse(x.equals(cx) != cx.equals(x));
    }

    @Test public void t3_ODF() {
        Object x = new Object();
        D dx = new D(1, 4);
        assertFalse(x.equals(dx) != dx.equals(x));
    }

    @Test public void t3_CDF() {
        C cx = new C(1);
        D dx = new D(1, 4);
        assertFalse(cx.equals(dx) != dx.equals(cx));
    }
    /*
     * P4: It is transitive: for any non-null reference values x, y, and z,
     * if x.equals(y) returns true and y.equals(z) returns true, then
     * x.equals(z) should return true.
     */
// you do not need to write tests for P4
}