package it.ternali.biblioteca.controller;

import it.ternali.biblioteca.controller.exception.UserAlreadyExistException;
import it.ternali.biblioteca.controller.service.UtenteService;
import it.ternali.biblioteca.model.Ruolo;
import it.ternali.biblioteca.model.Utente;
import it.ternali.biblioteca.model.validators.RegistrationValidatorUser;
import it.ternali.biblioteca.model.validators.UpdateValidatorUser;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/admin/gestione")
public class AdminUtenteController {

    private final UtenteService service;

    public AdminUtenteController(UtenteService service) {
        this.service = service;
    }

    @GetMapping("/utenti")
    public ModelAndView gestioneUtenti() {
        ModelAndView modelAndView = new ModelAndView("gestione_utenti");
        List<Utente> lista_utenti = service.findAll();
        modelAndView.addObject("lista_utenti", lista_utenti);
        return modelAndView;
    }

    @GetMapping("/utenti/delete/{id}")
    public ModelAndView eliminaUtente(@PathVariable("id") Long id) {
        ModelAndView modelAndView = new ModelAndView("redirect:/admin/gestione/utenti");
        service.deleteById(id);
        return modelAndView;
    }

    @GetMapping("/utenti/modifica/{id}")
    public ModelAndView formModificaUtente(@PathVariable("id") Long id, Model model) {
        ModelAndView modelAndView = new ModelAndView("modifica_utente");
        Utente utente = service.findById(id);
        modelAndView.addObject("utente", utente);
        model.addAttribute("utente_modify", new UpdateValidatorUser());
        return modelAndView;
    }

    @PostMapping("/utenti/conferma_modifica/{id}")
    public ModelAndView modificaUtente(@Valid @ModelAttribute("utente_modify") UpdateValidatorUser updateValidatorUser,
                                 BindingResult result, @PathVariable("id") Long id) {
        if (result.hasErrors()) {
            ModelAndView modelAndView = new ModelAndView("redirect:/admin/gestione/modifica/" + id);
            modelAndView.addObject("error", true);
            System.out.println("Errore durante la modifica.");
            return modelAndView;
        }
        ModelAndView modelAndView = new ModelAndView("redirect:/admin/gestione/utenti");
        Utente utente1 = service.findById(id);
        BeanUtils.copyProperties(updateValidatorUser, utente1);
        service.save(utente1);
        System.out.println("Utente modificato correttamente.");
        return modelAndView;
    }

    @GetMapping("/utenti/form-aggiungi-utente")
    public String formAggiungiUtente(Model model) {
        model.addAttribute("add_user_validator", new RegistrationValidatorUser());
        return "aggiungi-utente";
    }

    @PostMapping("/utenti/aggiungi-utente")
    public ModelAndView aggiungiUtente(@Valid @ModelAttribute("add_user_validator") RegistrationValidatorUser addValidatorUser,
                                       BindingResult result) throws UserAlreadyExistException {
        ModelAndView modelAndView;
        if (addValidatorUser.getRuolo() == null) {
            addValidatorUser.setRuolo(Ruolo.USER.toString());
        }
        if (result.hasErrors()) {
            System.out.println("Errore durante l'aggiunta di un utente");
            modelAndView = new ModelAndView("aggiungi-utente");
            modelAndView.addObject("error", true);
            return modelAndView;
        }
        service.save(addValidatorUser);
        modelAndView = new ModelAndView("redirect:/admin/gestione/utenti");
        return modelAndView;
    }
}
