import java.util.*;

public class MyTryTwo {
    private int V;
    private LinkedList<Integer> adj[];

    void Graph (int v) {
        V = v;
        adj = new LinkedList[v];
        for(int i=0; i<v; ++i)
            adj[i] = new LinkedList<Integer>();
    }

    void addEdge (int v, int w) {
        adj[v].add(w);
    }

    void BFS (int s) {
        boolean visited[] = new boolean [V];
        LinkedList<Integer> queue = new LinkedList<Integer>();
        LinkedList<Integer> nodes = new LinkedList<Integer>();


        visited[s] = true;
        queue.add(s);
        nodes.add(s);
//        System.out.println(s);
        while(queue.size() != 0) {
            s = queue.poll();

//            System.out.print(s + " ");
//            System.out.println(s);
            Iterator<Integer> i = adj[s].listIterator();

            while(i.hasNext()) {
                int n = i.next();
                if(!visited[n]) {
                    visited[n] = true;
                    queue.add(n);
                }
            }
        }
//        return nodes;
//        System.out.println(Arrays.toString(nodes.toArray()));
    }

//    boolean isReacheable (int from, int to) {
//
//        int[] possibilities = BFS(from);
//        for(int possibility : possibilities) {
//            if(possibility == to)
//                return true;
//        }
//        return false;
//    }

    public static void main(String args[]) {
        Graph g = new Graph(5);

        g.addEdge(0, 0);
        g.addEdge(0, 1);
        g.addEdge(0, 2);
        g.addEdge(1, 2);
        g.addEdge(1, 3);
        g.addEdge(1, 4);
        g.addEdge(2, 3);

        g.BFS(2);

    }
}
