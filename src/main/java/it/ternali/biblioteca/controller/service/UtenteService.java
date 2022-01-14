package it.ternali.biblioteca.controller.service;

import it.ternali.biblioteca.controller.exception.NoUserFindException;
import it.ternali.biblioteca.controller.exception.UserAlreadyExistException;
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
import java.util.function.Supplier;

@Service
public class UtenteService {

    private final UtenteRepository repository;
    private final BCryptPasswordEncoder passwordEncoder;
    private final Logger _log = LogManager.getLogger(UtenteService.class);
    Supplier<NoUserFindException> noUserFindException;

    public UtenteService(UtenteRepository repository, BCryptPasswordEncoder passwordEncoder) {
        this.repository = repository;
        this.passwordEncoder = passwordEncoder;
    }

    public boolean save(RegistrationValidatorUser validatorUser) {
        try {
            if (checkIfExist(validatorUser.getEmail())) {
                throw new UserAlreadyExistException();
            } else {
                Utente utente = new Utente();
                BeanUtils.copyProperties(validatorUser, utente);
                encrypt(validatorUser, utente);
                repository.save(utente);
                System.out.println("Utente salvato correttamente nel database.");
                return true;
            } // SISTEMARE DOPPIA RIPETIZIONE.
        } catch (UserAlreadyExistException e) {
            _log.error("Questo utente esiste già");
            return false;
        }
    }

    public void save(Utente utente) {
        repository.save(utente);
        _log.info("Utente salvato correttamente nel db");
    }

    public boolean checkIfExist(String email) throws UserAlreadyExistException {
        Utente utente = repository.findByEmail(email);
        if (utente != null) {
            return true;
        }
        throw new UserAlreadyExistException();
    }

    public void encrypt(RegistrationValidatorUser validatorUser, Utente utente) {
        utente.setPassword(passwordEncoder.encode(validatorUser.getPassword()));
    }

    public List<Utente> findAll() {
        List<Utente> listaUtenti = repository.findAll();
        if (listaUtenti.isEmpty()) {
            _log.error("Nessun user trovato nel db");
            throw new NoUserFindException();
        } else {
            return listaUtenti;
        }
    }

    public void deleteById(Long id) {
        Optional<Utente> utente = repository.findById(id);
        if (utente.isEmpty()) {
            _log.error("Nessun user trovato con questo id.");
            throw new NoUserFindException();
        } else {
            repository.deleteById(id);
            _log.info("Utente eliminato correttamente.");
        }
    }

    public Utente findById(Long id) {
        Optional<Utente> utente = repository.findById(id);
        return utente.orElseThrow(noUserFindException);
    }

    public Utente findByUsername(String username) {
        Optional<Utente> utente = repository.findByUsername(username);
        return utente.orElseThrow(noUserFindException);
    }
}
