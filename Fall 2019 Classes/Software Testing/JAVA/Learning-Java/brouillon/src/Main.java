import java.util.LinkedList;
import java.util.List;

public class Main {

    static int countNonNegative(int[] arr) {
        int count = 0;
        for(int i = 1; i <= arr.length; i++) {
            int element = arr[i-1];
            if(element > 0) {
                count++;
            } else {
                count = count;
            }
        }
        return count;
    }

    static int mutantCountNonNegative(int[] arr) {
        int count = 0;
        for(int i = 1; i <= arr.length; i++) {
            int element = arr[i-1];
            if(element > 0) {
                count++;
            } else {
                i++;
            }
        }
        return count;
    }

    static int max(int x, int y, int z) {
        int result = x;
        if(y > result) result = y;
        if(z > result) result = z;
        return result;
    }

    static int mutantMax(int x, int y, int z) {
        int result = x;
        if(y < result) result = y;
        if(z > result) result = z;
        return result;
    }

    static <T> java.util.List<T> concatenate(List<T> l, List<T> m) {
        // precondition: input lists are non-null//
        // postcondition: returns the concatenation of l and m (i.e.
        //                elements of l followed by elements of m)
        List<T> result = new LinkedList<T>(l);
        result.addAll(m);
        return result;
    }

}
