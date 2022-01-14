package it.ternali.biblioteca.model.repository;

import it.ternali.biblioteca.model.Utente;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UtenteRepository extends CrudRepository<Utente, Long> {
    Utente findByEmail(String email);
    Optional<Utente> findByUsername(String username);
    List<Utente> findAll();
    void deleteById(Long id);
    Optional<Utente> findById(Long id);
}
