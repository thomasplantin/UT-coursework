import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class PetRockTest {
    private PetRock rocky = new PetRock("Rocky");

    @Test
    void getName() {
        assertEquals("Rocky", rocky.getName());
    }
    @Test
    void testUnhappyToStart() {
        assertFalse(rocky.isHappy());
    }
    @Test
    void testHappyAfterPlay() {
        rocky.playWithRock();
        assertTrue(rocky.isHappy());
    }
}