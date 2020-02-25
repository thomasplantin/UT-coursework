package pset5;

import java.util.Arrays;
import java.util.TreeSet;
import java.util.Iterator;
import java.util.Set;

public class Graph {
    private int numNodes; // number of nodes in the graph

    private boolean[][] edges;
    // edges[i][j] is true if and only if there is an edge from node i to node j

    // class invariant: fields "edges" is non-null;
    //                  "edges" is a square matrix;
    //                  numNodes is number of rows in "edges"

    public Graph(int size) {
        numNodes = size;
        // your code goes here
        // ...
        edges = new boolean[numNodes][numNodes];
        // Initializing the graph to false
        for(int i = 0; i < numNodes; i++) {
            for(int j = 0; j < numNodes; j++) {
                edges[i][j] = false;
            }
        }
    }

    public String toString() {
        return "numNodes: " + numNodes + "\n" + "edges: " + Arrays.deepToString(edges);
    }

    public boolean equals(Object o) {
        if (o.getClass() != Graph.class) return false;
        return toString().equals(o.toString());
    }

    public void addEdge(int from, int to) {
        // postcondition: adds a directed edge "from" -> "to" to this graph
        // your code goes here
        // ...
        edges[from][to] = true;
    }

    public boolean reachable(Set<Integer> sources, Set<Integer> targets) {
        if (sources == null || targets == null) throw new IllegalArgumentException();
        // postcondition: returns true if (1) "sources" does not contain an illegal node,
        //                                (2) "targets" does not contain an illegal node, and
        //                                (3) for each node "m" in set "targets", there is some
        //                                node "n" in set "sources" such that there is a directed
        //                                path that starts at "n" and ends at "m" in "this"; and
        //                                false otherwise
        // your code goes here
        // ...

        Iterator<Integer> itrTargets = targets.iterator();
        int targetNode;
        int sourceNode;
        boolean flag;

        while(itrTargets.hasNext()) {
            flag = false;
            targetNode = itrTargets.next();
            if(targetNode >= numNodes || targetNode < 0) {  // Checking postcondition (2)
                System.out.println("Postcondition (2) violated!");
                return false;
            }
            Iterator<Integer> itrSources = sources.iterator();
            while(itrSources.hasNext()) {
                sourceNode = itrSources.next();
                if(sourceNode >= numNodes || sourceNode < 0) { // Checking postcondition (1)
                    System.out.println("Postcondition (1) violated!");
                    return false;
                }
                if(edges [sourceNode] [targetNode]) { // If there exists an edge from sourceIndex to targetIndex
                    flag = true;
                    System.out.println("### Confirmed path to target node " + targetNode + "! ###");
                    System.out.println("Path detected = (" + sourceNode + ", " + targetNode + ")\n");
                    break;
                }
            }
            if(!flag) {   // If for one target node there does not exist a single source node
                System.out.println("Postcondition (3) violated!");
                return false;
            }
        }
        System.out.println("All postconditions approved!");
        return true;
    }


// PERSONAL CODE FOR DEVELOPMENT
//    public static void main (String[] args) {
//        Graph g = new Graph(3);
//        Set<Integer> sources = new TreeSet<Integer>();
//        Set<Integer> targets = new TreeSet<Integer>();
//        sources.add(0);
//        sources.add(1);
//        targets.add(1);
//        targets.add(2);
//        targets.add(0);
//        g.addEdge(0, 1);
//        g.addEdge(0, 2);
//        g.addEdge(1, 0);
//        System.out.println(g.reachable(sources, targets));
//    }

}