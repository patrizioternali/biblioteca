package it.ternali.biblioteca.controller.service;

import it.ternali.biblioteca.model.Libro;
import it.ternali.biblioteca.model.repository.LibroRepository;
import it.ternali.biblioteca.model.validators.AddValidatorLibro;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class LibroService {

    private final LibroRepository repository;
    private final GenereService service;

    public LibroService(LibroRepository repository, GenereService service) {
        this.repository = repository;
        this.service = service;
    }

    public List<Libro> findAll() {
        return repository.findAll();
    }

    public void save(AddValidatorLibro validatorLibro) {
        Libro libro = new Libro();
        BeanUtils.copyProperties(validatorLibro, libro);
        libro.setGenere(service.findByNomeGenere(validatorLibro.getGenere()));
        repository.save(libro);
    }

    public void save(Libro libro) {
        repository.save(libro);
    }

    public Libro findById(Long id) {
        Optional<Libro> optional = repository.findById(id);
        return optional.orElse(null);
    }

    public void deleteById(Long id) {
        repository.deleteById(id);
    }
}
