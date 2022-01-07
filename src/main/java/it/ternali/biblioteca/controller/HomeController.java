package it.ternali.biblioteca.controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import it.ternali.biblioteca.controller.service.LibroService;
import it.ternali.biblioteca.model.Libro;
import it.ternali.biblioteca.model.PopularBook;
import it.ternali.biblioteca.model.Stato;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

@Controller
public class HomeController {

    private final LibroService service;

    public HomeController(LibroService service) {
        this.service = service;
    }

    @GetMapping("/homepage")
    public ModelAndView getHomePage() throws IOException {
        ObjectMapper jsonReader = new ObjectMapper();
        JsonNode libri = jsonReader.readTree(new URL("https://api.itbook.store/1.0/new")).get("books");
        List<PopularBook> popularBooks = new ArrayList<>();
        if (libri.isArray()) {
            int count = 0;
            for (JsonNode node : libri) {
                if (count == 5)
                    break;
                PopularBook libro = new PopularBook();
                libro.setTitle(node.get("title").toString());
                libro.setSubtitle(node.get("subtitle").toString());
                libro.setImage(node.get("image").toString());
                libro.setUrl(node.get("url").toString());
                popularBooks.add(libro);
                count++;
            }
        }
        ModelAndView mv = new ModelAndView("home-page");
        mv.addObject("popularBooks", popularBooks);

        List<Libro> not_filtered = service.findAll();
        List<Libro> database = new ArrayList<>();
        for (Libro libro : not_filtered) {
            if (libro.getStato().equals(Stato.DISPONIBILE.toString())) {
                database.add(libro);
            }
        }
        mv.addObject("not_filtered", not_filtered);
        mv.addObject("libridb", database);
        return mv;
    }
}
