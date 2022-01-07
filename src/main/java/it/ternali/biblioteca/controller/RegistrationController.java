package it.ternali.biblioteca.controller;

import it.ternali.biblioteca.controller.service.UtenteService;
import it.ternali.biblioteca.model.Ruolo;
import it.ternali.biblioteca.model.validators.RegistrationValidatorUser;
import lombok.AllArgsConstructor;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import javax.validation.Valid;

@Controller
@AllArgsConstructor
public class RegistrationController {

    private UtenteService service;

    @GetMapping("/registercheck")
    public String redirectRegister(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || authentication instanceof AnonymousAuthenticationToken) {
            model.addAttribute("utente_register", new RegistrationValidatorUser());
            return "registration-page";
        }
        return "redirect:/";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("utente_register") RegistrationValidatorUser validatorUser,
                                 BindingResult result, Model model) {
        validatorUser.setRuolo(Ruolo.USER.toString());
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            return "redirect:/";
        }
        if (result.hasErrors()) {
            model.addAttribute("reg_error", true);
            System.out.println("Errore durante la registrazione");
            return "redirect:/registercheck";
        }
        if (service.save(validatorUser)) {
            System.out.println("Registrazione andata a buon fine.");
            return "redirect:/homepage";
        }
        return "redirect:/registercheck";
    }

}
