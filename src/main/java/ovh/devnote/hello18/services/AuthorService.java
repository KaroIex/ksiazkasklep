package ovh.devnote.hello18.services;

import org.springframework.transaction.annotation.Transactional;
import ovh.devnote.hello18.entity.Autor;

import java.util.List;

public interface AuthorService {

    @Transactional
    List<Autor> getAuthors();

    void saveAuthor(Autor autor);

    @Transactional
    Autor getAuthor(int autorId);

    @Transactional
    List<Autor> getAuthor();
}