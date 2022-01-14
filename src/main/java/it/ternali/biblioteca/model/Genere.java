package it.ternali.biblioteca.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "genere")
@Getter
@Setter
@NoArgsConstructor
public class Genere {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "nome_genere")
    private String genere;
    @OneToMany(mappedBy = "genere")
    private List<Libro> libri;

    public Genere(String genere) {
        this.genere = genere;
    }
}
