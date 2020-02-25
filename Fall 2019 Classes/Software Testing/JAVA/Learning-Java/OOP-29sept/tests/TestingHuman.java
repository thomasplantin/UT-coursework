import static org.junit.Assert.*;
import org.junit.Test;

public class TestingHuman {

    @Test
    public void t1() {
        Human Tim = new Human();
        Tim.createHuman("Tim", 32, 70, "brown");
        Tim.speak();
        assertEquals("Tim", Tim.getName());
    }

    @Test
    public void t2() {
        Human Tim = new Human();
        Tim.createHuman("Tim", 32, 70, "brown");
        Tim.speak();
        assertFalse(Tim instanceof Man);
    }

}
