package it.ternali.biblioteca.controller.service;

import it.ternali.biblioteca.controller.exception.NoObjectFindException;
import it.ternali.biblioteca.controller.exception.ObjectAlreadyExistException;
import it.ternali.biblioteca.model.Libro;
import it.ternali.biblioteca.model.repository.LibroRepository;
import it.ternali.biblioteca.model.validators.AddValidatorLibro;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class LibroService {

    private final LibroRepository repository;
    private final GenereService service;
    private final Logger _log = LogManager.getLogger(LibroService.class);

    public LibroService(LibroRepository repository, GenereService service) {
        this.repository = repository;
        this.service = service;
    }

    public List<Libro> findAll() {
        List<Libro> listaLibri = repository.findAll();
        if (listaLibri.isEmpty()) {
            _log.error("Nessun libro trovato nel database");
            return null;
        } else {
            return listaLibri;
        }
    }

    public void save(AddValidatorLibro validatorLibro) {
        try {
            if (checkIfExist(validatorLibro.getTitolo())) {
                throw new ObjectAlreadyExistException();
            } else {
                Libro libro = new Libro();
                BeanUtils.copyProperties(validatorLibro, libro);
                libro.setGenere(service.findByNomeGenere(validatorLibro.getGenere()));
                repository.save(libro);
                _log.info("Libro salvato correttamente nel database.");
            }
        } catch (ObjectAlreadyExistException e) {
            _log.error("Questo libro è gia presente nel database.");
        }
    }

    public boolean checkIfExist(String title) throws ObjectAlreadyExistException {
        Optional<Libro> optional = repository.findByTitolo(title);
        if (optional.isEmpty()) {
            return false;
        } else {
            throw new ObjectAlreadyExistException();
        }
    }

    public void save(Libro libro) {
        repository.save(libro);
    }

    public Libro findById(Long id) {
        try {
            Optional<Libro> optional = repository.findById(id);
            return optional.orElseThrow(NoObjectFindException::new);
        } catch (NoObjectFindException e) {
            _log.error("Nessun libro trovato con questo id: " + id);
            return null;
        }
    }

    public void deleteById(Long id) {
        try {
            Optional<Libro> optional = repository.findById(id);
            if (optional.isEmpty()) {
                throw new NoObjectFindException();
            } else {
                repository.deleteById(id);
                _log.info("Libro eliminato correttamente dal database.");
            }
        } catch (NoObjectFindException e) {
            _log.error("Nessun libro trovato con questo id: " + id);
        }
    }
}
