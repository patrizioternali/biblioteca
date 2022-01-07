package it.ternali.biblioteca.controller.service;

import it.ternali.biblioteca.model.Utente;
import it.ternali.biblioteca.model.repository.UtenteRepository;
import it.ternali.biblioteca.model.validators.LoginValidatorUser;
import it.ternali.biblioteca.model.validators.RegistrationValidatorUser;
import lombok.AllArgsConstructor;
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

    public Utente checkLogin(LoginValidatorUser validatorUser) {
        Utente utente = repository.findByUsername(validatorUser.getUsername());
        if (utente != null) {
            if (passwordEncoder.matches(validatorUser.getPassword(), utente.getPassword())) {
                System.out.println("Login eseguito correttamente");
                return utente;
            } else {
                System.out.println("Password non corretta");
                return null;
            }
        } else {
            System.out.println("Utente non trovato");
            return null;
        }
    }

    public boolean save(RegistrationValidatorUser validatorUser) {
        if (checkIfExist(validatorUser.getEmail())) {
            System.out.println("Esiste già un'utente con questa email");
            return false;
        }
        Utente utente = new Utente();
        BeanUtils.copyProperties(validatorUser, utente);
        encrypt(validatorUser, utente);
        repository.save(utente);
        System.out.println("Utente salvato correttamente nel database.");
        return true;
    }

    public void save(Utente utente) {
        repository.save(utente);
    }

    public boolean checkIfExist(String email) {
        Utente utente = repository.findByEmail(email);
        if (utente != null) {
            System.out.println("Questo utente esiste già");
            return true;
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
