package it.ternali.biblioteca.controller.service;

import it.ternali.biblioteca.controller.exception.NoObjectFindException;
import it.ternali.biblioteca.controller.exception.ObjectAlreadyExistException;
import it.ternali.biblioteca.model.Utente;
import it.ternali.biblioteca.model.repository.UtenteRepository;
import it.ternali.biblioteca.model.validators.RegistrationValidatorUser;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UtenteService {

    private final UtenteRepository repository;
    private final BCryptPasswordEncoder passwordEncoder;
    private final Logger _log = LogManager.getLogger(UtenteService.class);

    public UtenteService(UtenteRepository repository, BCryptPasswordEncoder passwordEncoder) {
        this.repository = repository;
        this.passwordEncoder = passwordEncoder;
    }

    public boolean save(RegistrationValidatorUser validatorUser) {
        try {
            if (checkIfExist(validatorUser.getEmail())) {
                throw new ObjectAlreadyExistException();
            } else {
                Utente utente = new Utente();
                BeanUtils.copyProperties(validatorUser, utente);
                encrypt(validatorUser, utente);
                repository.save(utente);
                _log.info("Utente salvato correttamente nel database.");
                return true;
            }
        } catch (ObjectAlreadyExistException e) {
            _log.error("Questo utente esiste già");
            return false;
        }
    }

    public void save(Utente utente) {
        repository.save(utente);
        _log.info("Utente salvato correttamente nel db");
    }

    public boolean checkIfExist(String email) throws ObjectAlreadyExistException {
        Utente utente = repository.findByEmail(email);
        if (utente != null) {
            throw new ObjectAlreadyExistException();
        }
        return false;
    }

    public void encrypt(RegistrationValidatorUser validatorUser, Utente utente) {
        utente.setPassword(passwordEncoder.encode(validatorUser.getPassword()));
    }

    public List<Utente> findAll() {
        List<Utente> listaUtenti = repository.findAll();
        if (listaUtenti.isEmpty()) {
            _log.error("Nessun utente trovato nel database.");
            return null;
        } else {
            return listaUtenti;
        }
    }

    public void deleteById(Long id) {
        try {
            Optional<Utente> utente = repository.findById(id);
            if (utente.isPresent()) {
                Utente utente1 = utente.get();
                repository.deleteById(utente1.getId());
                _log.info("Utente eliminato correttamente dal database.");
            } else {
                throw new NoObjectFindException();
            }
        } catch (NoObjectFindException e) {
            e.printStackTrace();
        }

    }

    public Utente findById(Long id) {
        try {
            Optional<Utente> utente = repository.findById(id);
            return utente.orElseThrow(NoObjectFindException::new);
        } catch (NoObjectFindException e) {
            _log.error("Nessun utente trovato con questo id: " + id);
            return null;
        }
    }

    public Optional<Utente> findByUsername(String username) {
        try {
            Optional<Utente> utente = repository.findByUsername(username);
            return Optional.of(utente.orElseThrow(NoObjectFindException::new));
        } catch (NoObjectFindException e) {
            _log.error("Nessun utente trovato con questo username: " + username);
            return Optional.empty();
        }
    }
}
