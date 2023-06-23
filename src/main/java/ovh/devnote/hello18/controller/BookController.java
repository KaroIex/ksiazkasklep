package ovh.devnote.hello18.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ovh.devnote.hello18.dao.BookDAO;
import ovh.devnote.hello18.dto.BookDTO;
import ovh.devnote.hello18.entity.Autor;
import ovh.devnote.hello18.entity.Kategoria;
import ovh.devnote.hello18.entity.Ksiazka;
import ovh.devnote.hello18.services.AuthorService;
import ovh.devnote.hello18.services.BookService;
import ovh.devnote.hello18.services.CategoryService;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/books")
public class BookController {
    @Autowired
    private CategoryService categoryService;

    @Autowired
    private BookDAO bookDAO;

    @Autowired
    private BookService bookService;

    @Autowired
    private AuthorService authorService;

    @GetMapping("/list")
    public String listCustomers(Model model) {
        List<Ksiazka> books = bookService.getBooks();
        model.addAttribute("books", books);
        return "bookslist";
    }

    @GetMapping("/bookformadd")
    public String addForm(Model model) {
        Ksiazka book = new Ksiazka();
        List<Kategoria> categories = categoryService.getCategories();
        List<Autor> authors = authorService.getAuthors(); // Dodane: Pobierz listę autorów

        model.addAttribute("book", book);
        model.addAttribute("categories", categories);
        model.addAttribute("authors", authors); // Dodane: Dodaj listę autorów do modelu

        return "addbookform";
    }


    @PostMapping("/saveBook")
    public String saveBook(@ModelAttribute("bookDTO") BookDTO bookDTO) {
        int id = bookDTO.getId();
        Ksiazka ksiazka = bookService.getBook(id);
        if (ksiazka == null) {
            ksiazka = new Ksiazka();
        }
        Kategoria kat = categoryService.getCategory(bookDTO.getKategoriaid()); // Pobierz obiekt Kategoria na podstawie kategoriaid
        ksiazka.setKategoria(kat); // Ustaw obiekt Kategoria na książce
        ksiazka.setNazwa(bookDTO.getNazwa());
        ksiazka.setWydawnictwo(bookDTO.getWydawnictwo());
        ksiazka.setCena(bookDTO.getCena());

        // Przypisanie autorów do książki
        Set<Autor> autorzy = new HashSet<>();
        if (bookDTO.getAutorzy() != null) {
            //Set<Autor> autorzy = new HashSet<>();
            for (Integer autorId : bookDTO.getAutorzy()) {
                Autor autor = authorService.getAuthor(autorId);
                if (autor != null) {
                    autorzy.add(autor);
                }
            }
            ksiazka.setAutorzy(autorzy);
        }
        //ksiazka.setAutorzy(autorzy);

        bookService.saveBook(ksiazka);
        return "redirect:/books/list";
    }


    @GetMapping("/formadd2")
    public String addForm2(Model model) {
        BookDTO bookDTO = new BookDTO();
        List<Autor> authors = authorService.getAuthors(); // Pobierz listę autorów

        model.addAttribute("bookDTO", bookDTO);
        model.addAttribute("categories", categoryService.getCategories());
        model.addAttribute("authors", authors); // Dodaj listę autorów do modelu

        return "addbookform2";
    }


    @GetMapping("/deleteBook")
    public String deleteBook(@RequestParam("bookId") int bookId) {
        bookService.deleteBook(bookId);
        return "redirect:/books/list";
    }

    @GetMapping("/updateBookForm")
    public String updateBookForm(@RequestParam("bookId") int bookId, Model model) {
        Ksiazka ksiazka = bookService.getBook(bookId);
        List<Kategoria> categories = categoryService.getCategories();
        List<Autor> authors = authorService.getAuthors();
        BookDTO bookDTO = new BookDTO();
        bookDTO.setId(ksiazka.getId());
        bookDTO.setNazwa(ksiazka.getNazwa());
        bookDTO.setWydawnictwo(ksiazka.getWydawnictwo());
        bookDTO.setCena(ksiazka.getCena());
        bookDTO.setKategoriaid(ksiazka.getKategoria().getId());
        List<Integer> selectedAuthors = new ArrayList<>();
        for (Autor autor : ksiazka.getAutorzy()) {
            selectedAuthors.add(autor.getId());
        }
        bookDTO.setAutorzy(selectedAuthors);

        model.addAttribute("bookDTO", bookDTO);
        model.addAttribute("categories", categories);
        model.addAttribute("currentCategoryId", ksiazka.getKategoria().getId());
        model.addAttribute("authors", authors);

        return "addbookform";
    }


}
