package it.ternali.biblioteca.controller.service;

import it.ternali.biblioteca.model.Utente;
import it.ternali.biblioteca.model.repository.UtenteRepository;
import it.ternali.biblioteca.model.validators.CustomUserDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    private final UtenteRepository repository;

    @Autowired
    public CustomUserDetailsService(UtenteRepository repository) {
        this.repository = repository;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Optional<Utente> utente = repository.findByUsername(username);
        if (utente.isPresent()) {
            Utente utente1 = utente.get();
            return new CustomUserDetails(utente1);
        }
        throw new UsernameNotFoundException("Username non trovato nel database");
    }
}
