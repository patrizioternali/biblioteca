package it.ternali.biblioteca.controller;

import it.ternali.biblioteca.controller.service.GenereService;
import it.ternali.biblioteca.controller.service.LibroService;
import it.ternali.biblioteca.model.Genere;
import it.ternali.biblioteca.model.Libro;
import it.ternali.biblioteca.model.validators.AddValidatorGenere;
import it.ternali.biblioteca.model.validators.AddValidatorLibro;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/admin/gestione-catalogo")
public class AdminCatalogoController {

    private final GenereService service;
    private final LibroService libroService;

    public AdminCatalogoController(GenereService service, LibroService libroService) {
        this.service = service;
        this.libroService = libroService;
    }

    @GetMapping("/libro/form-aggiungi-libro")
    public String formAggiungiLibro(Model model) {
        model.addAttribute("libro_validator", new AddValidatorLibro());
        return "aggiungi-libro";
    }

    @PostMapping("/libro/aggiungi-libri")
    public ModelAndView aggiungiLibro(@Valid @ModelAttribute("libro_validator") AddValidatorLibro validatorLibro,
                                      BindingResult result) {
        ModelAndView modelAndView;
        if (result.hasErrors()) {
            System.out.println("Errore durante l'aggiunti del libro");
            modelAndView = new ModelAndView("redirect:/admin/gestione-catalogo/libro/form-aggiungi-libro");
            modelAndView.addObject("error", true);
        } else {
            libroService.save(validatorLibro);
            modelAndView = new ModelAndView("redirect:/catalogo-libri/show/true");
        }
        return modelAndView;
    }

    @GetMapping("/libro/modifica-libro-form/{id}")
    public ModelAndView formModificaLibro(@PathVariable("id") Long id, Model model) {
        ModelAndView modelAndView = new ModelAndView("modifica-libro");
        Libro libro = libroService.findById(id);
        modelAndView.addObject("libro", libro);
        model.addAttribute("libro_validator", new AddValidatorLibro());
        return modelAndView;
    }

    @PostMapping("/libro/conferma-modifica/{id}")
    public ModelAndView modificaLibro(@Valid @ModelAttribute("libro_validator") AddValidatorLibro validatorLibro,
                                      BindingResult result, @PathVariable("id") Long id) {
        ModelAndView modelAndView;
        if (result.hasErrors()) {
            System.out.println("Errore durante la modifica del libro");
            modelAndView = new ModelAndView("redirect:/admin/gestione-catalogo/libro/modifica-libro-form/" + id);
            modelAndView.addObject("error", true);
        } else {
            Libro libro = libroService.findById(id);
            BeanUtils.copyProperties(validatorLibro, libro);
            libroService.save(libro);
            System.out.println("Libro modificato correttamente");
            modelAndView = new ModelAndView("redirect:/catalogo-libri/show/true");
        }
        return modelAndView;
    }

    @GetMapping("/libro/delete/{id}")
    public ModelAndView deleteLibro(@PathVariable("id") Long id) {
        ModelAndView modelAndView = new ModelAndView("redirect:/catalogo-libri/show/true");
        libroService.deleteById(id);
        return modelAndView;
    }

    @GetMapping("/genere/lista-generi")
    public ModelAndView listaGeneri() {
        ModelAndView modelAndView = new ModelAndView("lista_generi");
        List<Genere> lista = service.findAll();
        modelAndView.addObject("lista_generi", lista);
        return modelAndView;
    }

    @GetMapping("/genere/form-aggiungi-genere")
    public String formAggiungiGenere(Model model) {
        model.addAttribute("genere_validator", new AddValidatorGenere());
        return "aggiungi-genere";
    }

    @PostMapping("/genere/aggiungi-genere")
    public ModelAndView aggiungiGenere(@Valid @ModelAttribute("genere_validator") AddValidatorGenere validatorGenere,
                                       BindingResult result) {
        ModelAndView modelAndView;
        if (result.hasErrors()) {
            System.out.println("Errore durante l'aggiunta del genere");
            modelAndView = new ModelAndView("redirect:/admin/genere/form-aggiungi-genere");
            modelAndView.addObject("error", true);
        } else {
            service.save(validatorGenere);
            modelAndView = new ModelAndView("redirect:/admin/gestione-catalogo/genere/lista-generi");
        }
        return modelAndView;
    }

    @GetMapping("/genere/delete/{id}")
    public ModelAndView deleteGenere(@PathVariable("id") Long id) {
        ModelAndView modelAndView = new ModelAndView("redirect:/admin/gestione-catalogo/genere/lista-generi");
        service.deleteById(id);
        return modelAndView;
    }
}
