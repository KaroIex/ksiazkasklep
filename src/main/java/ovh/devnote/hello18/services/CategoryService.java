package ovh.devnote.hello18.services;

import ovh.devnote.hello18.entity.Kategoria;

import java.util.List;

public interface CategoryService {
    List<Kategoria> getCategories();

    Kategoria getCategory(int id);

    void saveCategory(Kategoria category);

}
