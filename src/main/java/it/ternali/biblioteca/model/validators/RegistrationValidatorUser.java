package it.ternali.biblioteca.model.validators;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class RegistrationValidatorUser {

    @NotEmpty(message = "L'username non può essere vuoto.")
    private String username;
    @NotEmpty(message = "L'email non può essere vuota.")
    @Email(message = "Devi inserire un'email valida.")
    private String email;
    @NotEmpty(message = "La password non può essere vuota.")
    private String password;
    @NotNull(message = "La data di nascita non può essere vuota.")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate dataDiNascita;
    private String ruolo;

}
