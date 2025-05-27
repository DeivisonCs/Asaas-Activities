package domain;

import static org.junit.jupiter.api.Assertions.assertThrows;

import org.junit.jupiter.api.Test;

import com.cleanarchitecture.domain.school.Email;

public class EmailTest {

    @Test
    void InvalidArguments() {
        assertThrows(IllegalArgumentException.class, 
            () -> new Email(null));

        assertThrows(IllegalArgumentException.class, 
            () -> new Email(""));

        assertThrows(IllegalArgumentException.class, 
            () -> new Email("teste"));
            
    }
}
