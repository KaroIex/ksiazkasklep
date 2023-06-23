package ovh.devnote.hello18.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import ovh.devnote.hello18.entity.Autor;
import ovh.devnote.hello18.entity.Kategoria;
import ovh.devnote.hello18.services.AuthorService;
import ovh.devnote.hello18.services.CategoryService;

import java.util.List;

@Controller
@RequestMapping("/authors")
public class AuthorController {
    @Autowired
    private AuthorService authorService;

    @Autowired
    private CategoryService categoryService;

    @GetMapping("/list")
    public String listCustomers(Model model) {
        List<Autor> autorzy = authorService.getAuthors();
        model.addAttribute("autorzy", autorzy);
        return "authorlist";
    }


    @GetMapping("/authorformadd")
    public String addForm(Model model) {
        Autor autor = new Autor();
        model.addAttribute("autor", autor);
        return "addauthorform";
    }

    @PostMapping("/saveAuthor")
    public String saveAuthor(@ModelAttribute("autorzy") Autor autor) {
        authorService.saveAuthor(autor);
        return "redirect:/authors/list";
    }

    @GetMapping("/categories/list")
    public String listCategories(Model model) {
        List<Kategoria> kategorie = categoryService.getCategories();
        model.addAttribute("kategorie", kategorie);
        return "categorieslist";
    }

    @GetMapping("/categories/add")
    public String showAddCategoryForm(Model model) {
        Kategoria kategoria = new Kategoria();
        model.addAttribute("kategoria", kategoria);
        return "addcategoryform";
    }

    @PostMapping("/categories/saveCategory")
    public String saveCategory(@ModelAttribute("kategoria") Kategoria kategoria) {
        categoryService.saveCategory(kategoria);
        return "redirect:/authors/categories/list";
    }

}



