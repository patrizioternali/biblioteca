package it.ternali.biblioteca.model.repository;

import it.ternali.biblioteca.model.Genere;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GenereRepository extends CrudRepository<Genere, Long> {
    List<Genere> findAll();
    Genere findByGenere(String genere);
    void deleteById(Long id);
}
