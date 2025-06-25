package signUpPage

class User {

    String name;
    String email;
    String cpf;
    Date birthDate;
    String phoneNumber;
    String cep;
    String address;

    static mapping = {
        table 'client'
    }

    static constraints = {
        name blank: false, size: 3..50

        email email: true, blank: false, unique: true
        
        cpf blank: false, unique: true
        
        birthDate nullable: false, validator: { val ->
            if(val.after(new Date()))
                return 'invalid.birth.date'
        }
        
        phoneNumber matches: /\(\d{2}\)\d{4,5}-\d{4}/, blank: false
        
        cep blank: false, matches: /\d{5}-\d{3}/
        
        address blank: true
    }
}