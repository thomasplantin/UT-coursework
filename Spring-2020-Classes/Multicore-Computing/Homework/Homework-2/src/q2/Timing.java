package q2;

public class Timing {
    public static void main(String[] args) {
        System.out.println("Method,Threads,Time");
        for (int i = 1; i < 9; i++) {
            if(i%2==0 || i == 1) {
                long startTime = System.nanoTime();
                int res = q2.a.PIncrement.parallelIncrement(0, i);
                long endTime = System.nanoTime();
                if (res == 120000) {
                    System.out.println("CLH_Lock," + i + "," + (endTime - startTime));
                }
            }
        }

        for (int i = 1; i < 9; i++) {
            if(i%2==0 || i == 1) {
                long startTime = System.nanoTime();
                int res = q2.b.PIncrement.parallelIncrement(0, i);
                long endTime = System.nanoTime();
                if (res == 120000) {
                    System.out.println("Lamports_Mutex," + i + "," + (endTime - startTime));
                }
            }
        }

        for (int i = 1; i < 9; i++) {
            if(i%2==0 || i == 1) {
                long startTime = System.nanoTime();
                int res = q2.c.PIncrement.parallelIncrement(0, i);
                long endTime = System.nanoTime();
                if (res == 120000) {
                    System.out.println("Anderson_Lock," + i + "," + (endTime - startTime));
                }
            }
        }
    }
}