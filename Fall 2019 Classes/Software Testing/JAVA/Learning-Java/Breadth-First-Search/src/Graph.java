// Java program to print BFS traversal from a given source vertex.
// BFS(int s) traverses vertices reachable from s.
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedList;

// This class represents a directed graph using adjacency list
// representation
class Graph
{
    private int V;   // No. of vertices
    private LinkedList<Integer> adj[]; //Adjacency Lists

    // Constructor
    Graph(int v)
    {
        V = v;
        adj = new LinkedList[v];
        for (int i=0; i<v; ++i)
            adj[i] = new LinkedList();
    }

    // Function to add an edge into the graph
    void addEdge(int v,int w)
    {
        adj[v].add(w);
    }

    // prints BFS traversal from a given source s
    int[] BFS(int s) {
        boolean visited[] = new boolean [V];
        LinkedList<Integer> queue = new LinkedList<Integer>();
        LinkedList<Integer> nodes = new LinkedList<Integer>();


        visited[s] = true;
        queue.add(s);

        while(queue.size() != 0) {
            s = queue.poll();

            System.out.print(s + " ");
            nodes.add(s);
            Iterator<Integer> i = adj[s].listIterator();

            while(i.hasNext()) {
                int n = i.next();
                if(!visited[n]) {
                    visited[n] = true;
                    queue.add(n);
                }
            }
        }
        int[] array = nodes.stream().mapToInt(i->i).toArray();
//        System.out.println(Arrays.toString(array));
        return array;
    }

    boolean isReacheable (int from, int to) {
        int[] possibilities = BFS(from);
        for(int i = 0; i < possibilities.length; i++) {
            if(possibilities[i] == to)
                return true;
        }
        return false;
    }

    // Driver method to
    public static void main(String args[])
    {
        Graph g = new Graph(8);

        g.addEdge(2, 1);
        g.addEdge(1, 4);
        g.addEdge(4, 7);
        g.addEdge(3, 4);
        g.addEdge(3, 6);
        g.addEdge(3, 5);

        System.out.println(g.isReacheable(3, 7));
    }
}