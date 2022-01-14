package it.ternali.biblioteca.controller.service;

import it.ternali.biblioteca.controller.exception.NoObjectFindException;
import it.ternali.biblioteca.controller.exception.ObjectAlreadyExistException;
import it.ternali.biblioteca.model.Genere;
import it.ternali.biblioteca.model.repository.GenereRepository;
import it.ternali.biblioteca.model.validators.AddValidatorGenere;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class GenereService {

    private final GenereRepository repository;
    private final Logger _log = LogManager.getLogger(GenereService.class);

    public GenereService(GenereRepository repository) {
        this.repository = repository;
    }

    public void save(AddValidatorGenere validatorGenere) {
        try {
            if (checkIfExist(validatorGenere.getNome_genere())) {
                throw new ObjectAlreadyExistException();
            } else {
                Genere genere = new Genere();
                genere.setGenere(validatorGenere.getNome_genere());
                repository.save(genere);
                _log.info("Genere salvato correttamente nel database.");
            }
        } catch (ObjectAlreadyExistException e) {
            _log.error("Questo genere esiste già");
        }
    }

    public boolean checkIfExist(String name) throws ObjectAlreadyExistException {
        Optional<Genere> optional = repository.findByGenere(name);
        if (optional.isPresent()) {
            throw new ObjectAlreadyExistException();
        } else {
            return false;
        }
    }

    public List<Genere> findAll() {
        List<Genere> listaGeneri = repository.findAll();
        if (listaGeneri.isEmpty()) {
            _log.error("Nessun genere trovato nel database.");
            return null;
        } else {
            return listaGeneri;
        }
    }

    public Genere findByNomeGenere(String nome) {
        try {
            Optional<Genere> optional = repository.findByGenere(nome);
            return optional.orElseThrow(NoObjectFindException::new);
        } catch (NoObjectFindException e) {
            _log.error("Nessun genere trovato con questo nome: " + nome);
            return null;
        }
    }

    public void deleteById(Long id) {
        try {
            Optional<Genere> optional = repository.findById(id);
            if (optional.isEmpty()) {
                throw new NoObjectFindException();
            } else {
                repository.deleteById(id);
                _log.info("Genere eliminato correttamente dal database.");
            }
        } catch (NoObjectFindException e) {
            _log.error("Nessun genere trovato con questo id: " + id);
        }
    }
}
