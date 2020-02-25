/*
 * Given a set of coordinates, write a function that returns the total number of rectangles that can be drawn on a
 * plane. Note that the rectangles should be straight, and not tilted.
 */

import java.util.HashMap;

class Rectangles {

    static int rectangles(int[][] points) {
        int pointsX = 0;
        int pointsY = 0;
        HashMap<Integer, Integer> X = new HashMap<>();
        HashMap<Integer, Integer> Y = new HashMap<>();

        for(int[] i : points) {
            if(X.containsValue(i[0])) {
                System.out.println(i[0]);
                pointsX++;
            }
            else {
                X.put(i[0], i[0]);
            }

            if(Y.containsValue(i[1])) {
                pointsY++;
            }
            else {
                Y.put(i[1], i[1]);
            }
        }
        return pointsY;
    }
}
