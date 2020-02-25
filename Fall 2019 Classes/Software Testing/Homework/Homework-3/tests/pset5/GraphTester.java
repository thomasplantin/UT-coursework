package pset5;

import static org.junit.Assert.*;
import java.util.TreeSet;
import java.util.Set;
import org.junit.Test;

public class GraphTester {
    // tests for method "addEdge" in class "Graph"
    @Test public void tae0() {
        System.out.println("\ntae0:");
        Graph g = new Graph(2);
        g.addEdge(0, 1);
        System.out.println(g);
        assertEquals(g.toString(), "numNodes: 2\nedges: [[false, true], [false, false]]");
    }
    // your tests for method "addEdge" in class "Graph" go here
    // 1 x- you must provide at least 4 test methods;
    // 2 x- each test method has at least 1 invocation of addEdge;
    // 3 x- each test method creates exactly 1 graph
    // 4 x- each test method creates a unique graph w.r.t. "equals" method
    // 5 x- each test method has at least 1 test assertion;
    // 6 x- your test methods provide full statement coverage of your
    //      implementation of addEdge and any helper methods
    // 7 x- no test method directly invokes any method that is not
    //      declared in the Graph class as given in this homework
    // ...

    @Test public void tae1() {
        System.out.println("\ntae1:");
        Graph g = new Graph(3);
        g.addEdge(0, 0);
        g.addEdge(2, 1);
        System.out.println(g);
        assertEquals(g.toString(), "numNodes: 3\nedges: [[true, false, false], [false, false, false], " +
                "[false, true, false]]");
        assertFalse(g.equals(Graph.class));
    }

    @Test public void tae2() {
        System.out.println("\ntae2:");
        Graph g = new Graph(1);
        g.addEdge(0, 0);
        System.out.println(g);
        assertEquals(g.toString(), "numNodes: 1\nedges: [[true]]");
        assertFalse(g.equals(Graph.class));
    }

    @Test public void tae3() {
        System.out.println("\ntae3:");
        Graph g = new Graph(2);
        g.addEdge(0, 0);
        System.out.println(g);
        assertEquals(g.toString(), "numNodes: 2\nedges: [[true, false], [false, false]]");
        System.out.println("");
        g.addEdge(1, 1);
        System.out.println(g);
        assertEquals(g.toString(), "numNodes: 2\nedges: [[true, false], [false, true]]");
        assertFalse(g.equals(Graph.class));
    }

    @Test public void tae4() {
        System.out.println("\ntae4:");
        Graph g = new Graph(2);
        g.addEdge(0, 0);
        g.addEdge(0, 1);
        g.addEdge(1, 0);
        g.addEdge(1, 1);
        System.out.println(g);
        assertEquals(g.toString(), "numNodes: 2\nedges: [[true, true], [true, true]]");
        assertFalse(g.equals(Graph.class));
    }


    // tests for method "reachable" in class "Graph"
    @Test public void tr0() {
        System.out.println("\ntr0:");
        Graph g = new Graph(1);
        Set<Integer> nodes = new TreeSet<Integer>();
        nodes.add(0);
        assertFalse(g.reachable(nodes, nodes));
    }
    // your tests for method "reachable" in class "Graph" go here
    // 1 x- you must provide at least 6 test methods;
    // 2 x- each test method must have at least 1 invocation of reachable;
    // 3 x- each test method must have at least 1 test assertion;
    // 4 x- at least 2 test methods must have at least 1 invocation of addEdge;
    // 5 x- your test methods must provide full statement coverage of your
    //      implementation of reachable and any helper methods
    // 6 x- no test method directly invokes any method that is not
    //      declared in the Graph class as given in this homework
    // ...

    @Test public void tr1() {
        System.out.println("\ntr1:");
        Graph g = new Graph(2);
        Set<Integer> nodes = new TreeSet<Integer>();
        nodes.add(0);
        nodes.add(1);
        g.addEdge(0, 0);
        g.addEdge(0, 1);
        assertTrue(g.reachable(nodes, nodes));
    }

    @Test public void tr2() {
        System.out.println("\ntr2:");
        Graph g = new Graph(2);
        Set<Integer> nodes = new TreeSet<Integer>();
        nodes.add(0);
        nodes.add(2);
        g.addEdge(0, 1);
        assertFalse(g.reachable(nodes, nodes));
    }

    @Test public void tr3() {
        System.out.println("\ntr3:");
        Graph g = new Graph(2);
        Set<Integer> sourceNodes = new TreeSet<Integer>();
        Set<Integer> targetNodes = new TreeSet<Integer>();
        sourceNodes.add(0);
        targetNodes.add(2);
        g.addEdge(0, 1);
        assertFalse(g.reachable(sourceNodes, targetNodes));
    }

    @Test public void tr4() {
        System.out.println("\ntr4:");
        Graph g = new Graph(4);
        Set<Integer> nodes = new TreeSet<Integer>();
        nodes.add(0);
        nodes.add(1);
        nodes.add(2);
        nodes.add(3);
        g.addEdge(0, 0);
        g.addEdge(0, 1);
        g.addEdge(0, 2);
        g.addEdge(0, 3);
        assertTrue(g.reachable(nodes, nodes));
    }

    @Test public void tr5() {
        System.out.println("\ntr5:");
        Graph g = new Graph(1);
        Set<Integer> nodes = new TreeSet<Integer>();
        nodes.add(0);
        nodes.add(-1);
        assertFalse(g.reachable(nodes, nodes));
    }

    @Test public void tr6() {
        System.out.println("\ntr6:");
        Graph g = new Graph(2);
        Set<Integer> nodes = new TreeSet<Integer>();
        nodes.add(1);
        assertFalse(g.reachable(nodes, nodes));
        System.out.println("");
        g.addEdge(1, 1);
        assertTrue(g.reachable(nodes, nodes));
    }

}