package it.ternali.biblioteca.model.repository;

import it.ternali.biblioteca.model.Libro;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface LibroRepository extends CrudRepository<Libro, Long> {
    List<Libro> findAll();
    Optional<Libro> findById(Long id);
    void deleteById(Long id);
    Optional<Libro> findByTitolo(String titolo);
}
