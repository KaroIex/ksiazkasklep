package ovh.devnote.hello18.dao;

import ovh.devnote.hello18.entity.Kategoria;

import java.util.List;

public interface CategoryDAO {
    List<Kategoria> getCategories();

    void saveCategory(Kategoria kategoria);

    Kategoria getCategory(int id);
}
