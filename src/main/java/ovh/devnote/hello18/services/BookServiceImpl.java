package ovh.devnote.hello18.services;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ovh.devnote.hello18.dao.BookDAO;
import ovh.devnote.hello18.entity.Ksiazka;

import java.util.List;
import java.util.Set;

@Service
public class BookServiceImpl implements BookService {
    @Autowired
    private BookDAO bookDAO;

    @Override
    @Transactional
    public List<Ksiazka> getBooks() {
        return bookDAO.getBooks();
    }

    @Override
    @Transactional
    public Ksiazka getBook(int id) {
        return bookDAO.getBook(id);
    }

    @Override
    @Transactional
    public void saveBook(Ksiazka ksiazka) {
        if (ksiazka.getId() != 0) {
            Ksiazka existingBook = bookDAO.getBook(ksiazka.getId());
            if (existingBook != null) {
                existingBook.setNazwa(ksiazka.getNazwa());
                existingBook.setWydawnictwo(ksiazka.getWydawnictwo());
                existingBook.setCena(ksiazka.getCena());
                existingBook.setKategoria(ksiazka.getKategoria());
                existingBook.setAutorzy(ksiazka.getAutorzy());
                bookDAO.updateBook(existingBook);
            }
        } else {
            bookDAO.saveBook(ksiazka);
        }
    }


    @Override
    @Transactional
    public void updateBook(Ksiazka ksiazka) {
        bookDAO.updateBook(ksiazka);
    }

    @Override
    @Transactional
    public void deleteBook(int id) {
        bookDAO.deleteBook(id);
    }

    @Override
    @Transactional
    public Set<Ksiazka> getBooksInCart(Set<Integer> bookIds) {
        return bookDAO.getBooksInCart(bookIds);
    }

}
