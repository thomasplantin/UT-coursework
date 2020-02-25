package pset1;

import static org.junit.Assert.*;
import org.junit.Test;
import pset1.SLList.Node;

public class SLListRepOkTester {
    @Test public void t0() {
        SLList l = new SLList();
        assertTrue(l.repOk());

    }

    @Test public void t1() {
        SLList l = new SLList();
        Node n = new Node();
        // your code goes here
        n.elem = true;
        l.header = n;

        n.next = null;

        assertTrue(l.repOk());

    }

    @Test public void t2() {
        SLList l = new SLList();
        Node n = new Node();
        // your code goes here
        n.elem = true;
        l.header = n;

        n.next = n;

        assertFalse(l.repOk());

    }

    @Test public void t3() {
        SLList l = new SLList();
        Node n = new Node();
        // your code goes here
        n.elem = true;
        Node n1 = new Node();
        n1.elem = false;
        l.header = n;

        n.next = n1;
        n1.next = n;

        assertFalse(l.repOk());

    }
// your code goes here
    @Test public void t4() {
        SLList l = new SLList();
        Node n = new Node();
        // your code goes here
        n.elem = true;
        Node n1 = new Node();
        n1.elem = false;
        l.header = n;

        n.next = n1;
        n1.next = n1;

        assertFalse(l.repOk());

    }

    @Test public void t5() {
        SLList l = new SLList();
        Node n = new Node();
        // your code goes here
        n.elem = true;
        Node n1 = new Node();
        n1.elem = false;
        l.header = n1;

        n.next = n;
        n1.next = n;

        assertFalse(l.repOk());

    }

    @Test public void t6() {
        SLList l = new SLList();
        Node n = new Node();
        // your code goes here
        n.elem = true;
        Node n1 = new Node();
        n1.elem = false;
        l.header = n;

        n.next = n1;
        n1.next = null;

        assertTrue(l.repOk());

    }

    @Test public void t7() {
        SLList l = new SLList();
        Node n = new Node();
        // your code goes here
        n.elem = true;
        Node n1 = new Node();
        n1.elem = false;
        l.header = n1;

        n.next = null;
        n1.next = n;

        assertTrue(l.repOk());

    }

}
