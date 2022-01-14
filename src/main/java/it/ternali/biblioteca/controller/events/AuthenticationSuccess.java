package it.ternali.biblioteca.controller.events;

import it.ternali.biblioteca.controller.service.UtenteService;
import it.ternali.biblioteca.model.Utente;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Optional;
import java.util.Set;

public class AuthenticationSuccess implements AuthenticationSuccessHandler {

    @Autowired
    private UtenteService service;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
                                        HttpServletResponse response,
                                        Authentication authentication) throws IOException {
        Set<String> ruoli = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
        HttpSession session = request.getSession(false);
        Optional<Utente> optional = service.findByUsername(request.getParameter("username"));
        if (optional.isPresent()) {
            Utente utente = optional.get();
            session.setAttribute("utente", utente);
        }
        if (ruoli.contains("ADMIN")) {
            session.setAttribute("admin", true);
            response.sendRedirect("/homepage");
        } else {
            response.sendRedirect("/homepage");
        }
    }
}
