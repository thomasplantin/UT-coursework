package pset1;

import java.util.HashSet;
import java.util.Set;

public class SLList {
    Node header;  // Head of the list.
    static class Node {
        boolean elem; // The data stored in the node.
        Node next;

    }
    boolean repOk() {
// postcondition: returns true iff <this> is an acyclic list, i.e.,
// there is no path from a node to itself
        Set<Node> visited = new HashSet<Node>();
        Node n = header;
        while (n != null) {  // While the final node is not reached
            if (!visited.add(n)) {
                return false;
            }
            n = n.next;
        }
        return true;
    }

    void add(boolean e) {
// precondition: this.repOk()
// postcondition: adds <e> in a new node at the beginning of the
// list; the rest of the list is unmodified
// your code goes here
        Node newNode = new Node();  // Declare the new node
        newNode.elem = e;
        newNode.next = header;  // Make the new node point to the old header
        header = newNode;  // Make the new node the new header now

    }

}
