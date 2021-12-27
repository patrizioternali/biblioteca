package it.ternali.biblioteca.security.data;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import java.io.Serializable;

@Getter
@Setter
public class UserData implements Serializable {

    @NotEmpty(message = "The name can not be empty")
    private String username;
    @NotEmpty(message = "Email can not be empty")
    @Email(message = "Please, insert a valid email")
    private String email;
    @NotEmpty(message = "Password can not be empty")
    private String password;

}
