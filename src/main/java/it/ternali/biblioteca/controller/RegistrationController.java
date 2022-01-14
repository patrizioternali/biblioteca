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
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
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
    public ModelAndView register(@Valid @ModelAttribute("utente_register") RegistrationValidatorUser validatorUser,
                                 BindingResult result, HttpServletResponse response) {
        ModelAndView modelAndView;
        validatorUser.setRuolo(Ruolo.USER.toString());
        Authentication authentication;
        authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            System.out.println("Utente già autenticato.");
            modelAndView = new ModelAndView("redirect:/homepage");
        } else {
            if (result.hasErrors()) {
                System.out.println("Errore durante la registrazione");
                modelAndView = new ModelAndView("registration-page");
                response.setStatus(400);
                modelAndView.addObject("reg_error", true);
            } else {
                boolean reg = service.save(validatorUser);
                if (reg) {
                    modelAndView = new ModelAndView("redirect:/homepage");
                } else {
                    modelAndView = new ModelAndView("registration-page");
                    modelAndView.addObject("already_exist", true);
                }
            }
        }
        return modelAndView;
    }

}
