package ovh.devnote.hello18.dao;

import ovh.devnote.hello18.entity.Autor;

import java.util.List;

public interface AuthorDAO {
    List<Autor> getAuthors();

    void saveAuthor(Autor autor);

    Autor getAuthor(int autorId);
}
