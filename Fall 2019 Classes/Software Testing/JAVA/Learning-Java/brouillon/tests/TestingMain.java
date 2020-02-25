import org.junit.Test;
import static org.junit.Assert.*;

public class TestingMain {

    int[] array = {2, -1, -1, 2};
    int x = 1; int y = 3; int z = 2;

    @Test
    public void testingCountNonNegative() {
        assertEquals(2, Main.countNonNegative(array));
    }

    @Test
    public void testingMutantCountNonNegative() {
        assertEquals(2, Main.mutantCountNonNegative(array));
    }

    @Test
    public void testMax() {
        assertEquals(3, Main.max(x, y, z));
    }

    @Test
    public void testMutantMax() {
        assertEquals(2, Main.mutantMax(x, y, z));
    }



}
