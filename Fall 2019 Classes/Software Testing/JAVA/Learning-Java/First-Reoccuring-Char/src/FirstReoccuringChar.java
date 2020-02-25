import java.util.*;
import static java.util.Objects.hash;

public class FirstReoccuringChar {
    public static char returnFirst(String data) {
        char[] splitData = data.toCharArray();
        HashMap<Integer, Character> hm=new HashMap<Integer,Character>();
        for(int i = 0; i < splitData.length; i++) {
            if(hm.containsKey(hash(splitData[i]))) {
                return splitData[i];
            }
            hm.put(hash(splitData[i]), splitData[i]);

        }
        return '-';
    }

    public static void main(String args[]) {
        System.out.println(returnFirst("break-fk"));
    }
}
