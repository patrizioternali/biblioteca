package it.ternali.biblioteca.controller;

import it.ternali.biblioteca.controller.service.LibroService;
import it.ternali.biblioteca.controller.service.UtenteService;
import it.ternali.biblioteca.model.Libro;
import it.ternali.biblioteca.model.Stato;
import it.ternali.biblioteca.model.Utente;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@Controller
@RequestMapping("/catalogo-libri")
public class CatalogoController {

    private final LibroService service;
    private final UtenteService utenteService;

    public CatalogoController(LibroService service, UtenteService utenteService) {
        this.service = service;
        this.utenteService = utenteService;
    }

    @GetMapping("/show/{boolean}")
    public ModelAndView mostraCatalogo(@PathVariable("boolean") String booleanIsAdmin, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("catalogo-libri");
        List<Libro> libri = service.findAll();
        List<Libro> libri_disponibili = new ArrayList<>();
        for (Libro libro : libri) {
            if (libro.getStato().equals(Stato.DISPONIBILE.toString())) {
                libri_disponibili.add(libro);
            }
        }
        modelAndView.addObject("catalogo", libri_disponibili);
        modelAndView.addObject("catalogo_admin", libri);
        if (booleanIsAdmin.equals("true")) {
            modelAndView.addObject("admin", true);
        }
        Utente utente = (Utente) session.getAttribute("utente");
        if (utente.getDataDiNascita().getYear() <= 1977) {
            modelAndView.addObject("year_true", true);
            List<Libro> libri_filtrati = libri_disponibili.stream().sorted(Comparator.comparing(Libro::getAnno)).toList();
            modelAndView.addObject("libri_filtrati", libri_filtrati);
        }
        return modelAndView;
    }

}
