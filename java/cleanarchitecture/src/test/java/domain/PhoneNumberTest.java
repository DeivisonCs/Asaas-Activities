package domain;

import static org.junit.jupiter.api.Assertions.assertThrows;

import org.junit.jupiter.api.Test;

import com.cleanarchitecture.domain.school.PhoneNumber;

public class PhoneNumberTest {

    @Test
    void InvalidArguments() {
        assertThrows(IllegalArgumentException.class, 
            () -> new PhoneNumber(null, null));

        assertThrows(IllegalArgumentException.class, 
            () -> new PhoneNumber("", ""));

        assertThrows(IllegalArgumentException.class, 
            () -> new PhoneNumber("24", "91111"));
            
    }
}
