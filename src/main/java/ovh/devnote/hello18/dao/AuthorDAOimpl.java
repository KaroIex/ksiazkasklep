package ovh.devnote.hello18.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import ovh.devnote.hello18.entity.Autor;
import ovh.devnote.hello18.entity.Ksiazka;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import java.util.List;

@Repository
public class AuthorDAOimpl implements AuthorDAO{

    @PersistenceUnit
    private EntityManagerFactory entityManagerFactory;


    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public List<Autor> getAuthors() {
        //sesja hibertabe
        Session currentSession = sessionFactory.getCurrentSession();
        //zapytanie
        Query<Autor> query = currentSession.createQuery(" FROM Autor", Autor.class);
        List<Autor> authors = query.getResultList();

        return authors ;
    }

    @Override
    public void saveAuthor(Autor author) {
        Session session = sessionFactory.getCurrentSession();
        session.save(author);
    }

    @Override
    @Transactional
    public Autor getAuthor(int autorId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        Autor author = entityManager.find(Autor.class, autorId);
        entityManager.close();
        return author;
    }

}
