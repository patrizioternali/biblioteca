package it.ternali.biblioteca.model.validators;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.NotEmpty;

@Getter
@Setter
@NoArgsConstructor
public class AddValidatorGenere {

    @NotEmpty(message = "Il nome del genere dev'essere specificato.")
    private String nome_genere;
}
