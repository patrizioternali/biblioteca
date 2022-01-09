package it.ternali.biblioteca.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "libro")
@Getter
@Setter
public class Libro {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "titolo")
    private String titolo;
    @Column(name = "autore")
    private String autore;
    @ManyToOne
    @JoinColumn(name = "genere_id")
    private Genere genere;
    @Column(name = "anno")
    private Integer anno;
    @Column(name = "stato")
    private String stato;
    private String immagine;

    public Libro() {
    }

    public Libro(String titolo, String autore, Genere genere, Integer anno, String stato, String immagine) {
        this.titolo = titolo;
        this.autore = autore;
        this.genere = genere;
        this.anno = anno;
        this.stato = stato;
        this.immagine = immagine;
    }

    public String getGenere() {
        if (this.genere == null) {
            return null;
        }
        return this.genere.getGenere();
    }
}
