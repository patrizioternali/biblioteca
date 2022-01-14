package it.ternali.biblioteca.controller;

import it.ternali.biblioteca.controller.service.UtenteService;
import it.ternali.biblioteca.model.Utente;
import it.ternali.biblioteca.model.validators.UpdateValidatorUser;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
@RequestMapping("/utente")
public class UtenteModificaController {

    private final UtenteService service;

    public UtenteModificaController(UtenteService service) {
        this.service = service;
    }

    @GetMapping("/modifica-form/{id}")
    public ModelAndView modificaForm(@PathVariable("id") Long id, Model model) {
        Utente utente = service.findById(id);
        model.addAttribute("utente_modify", new UpdateValidatorUser());
        ModelAndView modelAndView = new ModelAndView("self-modifica-utente");
        modelAndView.addObject("utente", utente);
        return modelAndView;
    }

    @PostMapping("/conferma-modifica/{id}")
    public ModelAndView confermaModifica(@Valid @ModelAttribute("utente_modify") UpdateValidatorUser validatorUser,
                                         BindingResult result, @PathVariable("id") Long id) {
        ModelAndView modelAndView;
        if (result.hasErrors()) {
            System.out.println("Errore durante la modifica del profilo");
            modelAndView = new ModelAndView("redirect:/utente/modifica-form/" + id);
            modelAndView.addObject("error", true);
        } else {
            Utente utente = service.findById(id);
            BeanUtils.copyProperties(validatorUser, utente);
            service.save(utente);
            System.out.println("Utente modificato correttamente");
            modelAndView = new ModelAndView("redirect:/homepage");
        }
        return modelAndView;
    }
}
