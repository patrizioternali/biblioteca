package it.ternali.biblioteca.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "utenti")
public class Utente {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(unique = true)
    @NotEmpty(message = "L'username non puo essere vuoto")
    private String username;
    @NotEmpty(message = "La password non puo essere vuota")
    private String password;
    @Column(unique = true)
    @NotEmpty(message = "L'email non puo essere vuota")
    @Email(message = "Inserire un email valida")
    private String email;
    private String ruolo;
    @NotNull(message = "La data di nascita non puo essere vuota")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate dataDiNascita;

    public Utente(String username, String password, String email, String ruolo, LocalDate dataDiNascita) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.ruolo = ruolo;
        this.dataDiNascita = dataDiNascita;
    }

}
