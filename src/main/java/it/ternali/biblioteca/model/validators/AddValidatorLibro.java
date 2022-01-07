package it.ternali.biblioteca.model.validators;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@NoArgsConstructor
public class AddValidatorLibro {

    @NotEmpty(message = "Il titolo dev'essere specificato.")
    private String titolo;
    @NotEmpty(message = "L'autore dev'essere specificato.")
    private String autore;
    @NotEmpty(message = "Il genere dev'essere specificato.")
    private String genere;
    @NotNull(message = "L'anno dev'essere specificato.")
    private Integer anno;
    @NotEmpty(message = "Lo stato del libro dev'essere specificato")
    private String stato;
    @NotEmpty(message = "L'immagine dev'essere specificata.")
    private String immagine;
}
