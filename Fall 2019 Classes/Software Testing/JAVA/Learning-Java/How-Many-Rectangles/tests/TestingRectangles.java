import org.junit.Test;
import static org.junit.Assert.*;

public class TestingRectangles {

    @Test
    public void test() {
        int[][] points = {
                {2, 1},
                {-4, 1},
                {-4, -2},
                {2, -2},
                {0, 1},
                {0, -2}
        };
        assertEquals(2, Rectangles.rectangles(points));
    }

}
