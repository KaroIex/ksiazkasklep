package ovh.devnote.hello18.services;

import ovh.devnote.hello18.entity.Ksiazka;

import java.util.List;
import java.util.Set;

public interface BookService {
    List<Ksiazka> getBooks();

    Set<Ksiazka> getBooksInCart(Set<Integer> id);

    Ksiazka getBook(int id);

    void saveBook(Ksiazka ksiazka);

    void updateBook(Ksiazka ksiazka);

    void deleteBook(int id);

}
