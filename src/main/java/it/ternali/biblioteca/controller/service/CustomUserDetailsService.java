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

    private final UtenteService service;

    @Autowired
    public CustomUserDetailsService(UtenteService service) {
        this.service = service;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Optional<Utente> utente = service.findByUsername(username);
        if (utente.isPresent()) {
            Utente utente1 = utente.get();
            return new CustomUserDetails(utente1);
        } else {
            throw new UsernameNotFoundException("Username non trovato nel database");
        }
    }
}
