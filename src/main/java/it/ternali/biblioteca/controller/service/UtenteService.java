package it.ternali.biblioteca.controller.service;

import it.ternali.biblioteca.controller.exception.UserAlreadyExistException;
import it.ternali.biblioteca.model.Utente;
import it.ternali.biblioteca.model.repository.UtenteRepository;
import it.ternali.biblioteca.model.validators.RegistrationValidatorUser;
import lombok.AllArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
public class UtenteService {

    private UtenteRepository repository;
    private BCryptPasswordEncoder passwordEncoder;
    private static final Logger _log = LogManager.getLogger(UtenteService.class);

    public boolean save(RegistrationValidatorUser validatorUser) {
        try {
            if (checkIfExist(validatorUser.getEmail())) {
                _log.info("Questo utente esiste già");
                return false;
            } else {
                Utente utente = new Utente();
                BeanUtils.copyProperties(validatorUser, utente);
                encrypt(validatorUser, utente);
                repository.save(utente);
                _log.info("Utente salvato correttamente nel database.");
                return true;
            }
        } catch (UserAlreadyExistException e) {
            _log.error(e.getMessage());
            return false;
        }
    }

    public void save(Utente utente) {
        repository.save(utente);
    }

    public boolean checkIfExist(String email) throws UserAlreadyExistException {
        Utente utente = repository.findByEmail(email);
        if (utente != null) {
            throw new UserAlreadyExistException("Esiste già un utente con questo nome");
        }
        return false;
    }

    public void encrypt(RegistrationValidatorUser validatorUser, Utente utente) {
        utente.setPassword(passwordEncoder.encode(validatorUser.getPassword()));
    }

    public List<Utente> findAll() {
        return repository.findAll();
    }

    public void deleteById(Long id) {
        repository.deleteById(id);
    }

    public Utente findById(Long id) {
        Optional<Utente> optional = repository.findById(id);
        return optional.orElse(null);
    }

    public Utente findByUsername(String username) {
        return repository.findByUsername(username);
    }
}
