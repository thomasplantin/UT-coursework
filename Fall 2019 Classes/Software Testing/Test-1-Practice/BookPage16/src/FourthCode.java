public class FourthCode {

    public static int oddOrPositive(int[] x) {
        int count = 0;
        for(int i = 0; i < x.length; i++) {
            if(x[i] % 2 == 0 || x[i] > 0) {
                count++;
            }
        }
        return count;
    }

}
