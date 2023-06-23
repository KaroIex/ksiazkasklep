package ovh.devnote.hello18.dao;

import ovh.devnote.hello18.entity.Ksiazka;

import java.util.List;
import java.util.Set;

public interface BookDAO {
    List<Ksiazka> getBooks();

    Set<Ksiazka> getBooksInCart(Set<Integer> id);

    void saveBook(Ksiazka ksiazka);

    void updateBook(Ksiazka ksiazka);

    Ksiazka getBook(int id);

    void deleteBook(int id);


}
