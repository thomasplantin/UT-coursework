import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class FirstCodeTest {

    @Test
    public void testFindLast() {
        assertEquals(-1, FirstCode.findLast(new int[] {2, 3, 5}, 4));
    }

}