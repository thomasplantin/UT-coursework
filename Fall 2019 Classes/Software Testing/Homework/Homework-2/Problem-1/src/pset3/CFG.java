package pset3;

import java.util.*;
import org.apache.bcel.classfile.JavaClass;
import org.apache.bcel.classfile.Method;

public class CFG {
    Set<Node> nodes = new HashSet<Node>();
    Map<Node, Set<Node>> edges = new HashMap<Node, Set<Node>>();

    public static class Node {
        int position;
        Method method;
        JavaClass clazz;

        Node(int p, Method m, JavaClass c) {
            position = p;
            method = m;
            clazz = c;
        }

        public Method getMethod() {
            return method;
        }

        public JavaClass getClazz() {
            return clazz;
        }

        public boolean equals(Object o) {
            if (!(o instanceof Node)) return false;
            Node n = (Node)o;
            return (position == n.position) && method.equals(n.method) && clazz.equals(n.clazz);
        }

        public int hashCode() {
            return position + method.hashCode() + clazz.hashCode();
        }

        public String toString() {
            return clazz.getClassName() + "." + method.getName() + method.getSignature() + ": " + position;
        }
    }

    public void addNode(int p, Method m, JavaClass c) {
        addNode(new Node(p, m, c));
    }

    private void addNode(Node n) {
        nodes.add(n);
        Set<Node> nbrs = edges.get(n);
        if (nbrs == null) {
            nbrs = new HashSet<Node>();
            edges.put(n, nbrs);
        }
    }

    public void addEdge(int p1, Method m1, JavaClass c1, int p2, Method m2, JavaClass c2) {
        Node n1 = new Node(p1, m1, c1);
        Node n2 = new Node(p2, m2, c2);
        addNode(n1);
        addNode(n2);
        Set<Node> nbrs = edges.get(n1);
        nbrs.add(n2);
        edges.put(n1, nbrs);
    }

    public void addEdge(int p1, int p2, Method m, JavaClass c) {
        addEdge(p1, m, c, p2, m, c);
    }

    public String toString() {
        return nodes.size() + " nodes\n" + "nodes: " + nodes + "\n" + "edges: " + edges;
    }

    public static <T> Object[] convertLinkedListToArray(LinkedList<T> nodes)
    {

        // Converting LinkedList to Array
        Object[] array = nodes.toArray();

        return array;
    }

    public boolean isReachable(String methodFrom, String clazzFrom,
                               String methodTo, String clazzTo) {
        // Implement the Breadth First Search algorithm to check if a method can reach another method
        boolean visited[] = new boolean [nodes.size()];
        LinkedList<String> queue = new LinkedList<String>();
        LinkedList<String> nodes = new LinkedList<String>();
        LinkedList<Integer> adj[];

        adj = new LinkedList[nodes.size()];
        for (int i=0; i<nodes.size(); ++i)
            adj[i] = new LinkedList();


        int s = 0;
        visited[s] = true;
        queue.add(methodFrom);

        while(queue.size() != 0) {
            methodFrom = queue.poll();

            nodes.add(methodFrom);
            Iterator<Integer> i = adj[s].listIterator();

            while(i.hasNext()) {
                int n = i.next();
                if(!visited[n]) {
                    visited[n] = true;
                }
            }
        }

        Object[] objArray = convertLinkedListToArray(nodes);

        // Convert Object[] to String[]
        String[] array = Arrays.copyOf(objArray,
                objArray.length,
                String[].class);

        for(int i = 0; i < array.length; i++) {
            if(array[i].equals(methodTo))
                return true;
        }
        return false;
    }
}