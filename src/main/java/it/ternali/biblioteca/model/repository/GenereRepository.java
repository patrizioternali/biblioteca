package it.ternali.biblioteca.model.repository;

import it.ternali.biblioteca.model.Genere;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface GenereRepository extends CrudRepository<Genere, Long> {
    List<Genere> findAll();
    Optional<Genere> findByGenere(String genere);
    void deleteById(Long id);
}
