import java.util.HashMap;

public class BasicHashMaps {
    static HashMap<String, Boolean> map = new HashMap<>();

    public static void main(String[] args) {
        map.put("Kenny", true);
        map.put("Joe", false);
        boolean a = map.get("Kenny");
        System.out.println(a);
    }

}
