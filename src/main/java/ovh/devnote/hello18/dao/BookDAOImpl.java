package ovh.devnote.hello18.dao;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import ovh.devnote.hello18.entity.Ksiazka;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Repository
public class BookDAOImpl implements BookDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Ksiazka> getBooks() {
        Session session = sessionFactory.getCurrentSession();
        CriteriaBuilder cb = session.getCriteriaBuilder();
        CriteriaQuery<Ksiazka> cq = cb.createQuery(Ksiazka.class);
        Root<Ksiazka> root = cq.from(Ksiazka.class);
        cq.select(root);
        return session.createQuery(cq).getResultList();
    }

    @Override
    public Ksiazka getBook(int id) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(Ksiazka.class, id);
    }

    @Override
    public void saveBook(Ksiazka ksiazka) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(ksiazka);
    }

    @Override
    public void updateBook(Ksiazka ksiazka) {
        Session session = sessionFactory.getCurrentSession();
        session.update(ksiazka);
    }

    @Override
    public void deleteBook(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        Ksiazka book = currentSession.get(Ksiazka.class, id);
        if (book != null) {
            currentSession.delete(book);
        }
    }


    @Override
    public Set<Ksiazka> getBooksInCart(Set<Integer> bookIds) {
        Session session = sessionFactory.getCurrentSession();
        if (bookIds.isEmpty()
        ) {
            return new HashSet<>();
        }
        Query<Ksiazka> query = session.createQuery(" from Ksiazka as k where k.id in (:booksId)", Ksiazka.class).setParameterList("booksId", bookIds);
        Set<Ksiazka> books = query.getResultStream().collect(Collectors.toSet());

        return books;
    }
}
