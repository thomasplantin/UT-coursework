import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class ThirdCodeTest {

    @Test
    void testCountPositive() {
        assertEquals(2, ThirdCode.countPositive(new int[]{0, 2, 3}));
    }
}
