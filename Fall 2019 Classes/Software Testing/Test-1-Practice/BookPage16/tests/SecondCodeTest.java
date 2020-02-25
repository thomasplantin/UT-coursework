import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class SecondCodeTest {

    @Test
    void testLastZero() {
        assertEquals(2, SecondCode.lastZero(new int[] {0, 2, 0, 4}));
    }

}
