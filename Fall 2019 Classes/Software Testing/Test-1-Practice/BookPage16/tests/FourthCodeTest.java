import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class FourthCodeTest {

    @Test
    void testOddOrPositive() {

        assertEquals(3, FourthCode.oddOrPositive(new int[]{-5, -2, 3, 4}));

    }
}
