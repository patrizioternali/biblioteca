package it.ternali.biblioteca.controller.service;

import it.ternali.biblioteca.model.Genere;
import it.ternali.biblioteca.model.repository.GenereRepository;
import it.ternali.biblioteca.model.validators.AddValidatorGenere;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GenereService {

    private final GenereRepository repository;

    public GenereService(GenereRepository repository) {
        this.repository = repository;
    }

    public void save(AddValidatorGenere validatorGenere) {
        Genere genere = new Genere();
        genere.setGenere(validatorGenere.getNome_genere());
        repository.save(genere);
    }

    public List<Genere> findAll() {
        return repository.findAll();
    }

    public Genere findByNomeGenere(String nome) {
        return repository.findByGenere(nome);
    }

    public void deleteById(Long id) {
        repository.deleteById(id);
    }
}
