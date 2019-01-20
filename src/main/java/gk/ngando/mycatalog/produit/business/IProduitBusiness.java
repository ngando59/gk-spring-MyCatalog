package gk.ngando.mycatalog.produit.business;

import java.util.List;

import gk.ngando.mycatalog.produit.domain.Produit;

public interface IProduitBusiness {
    public void add(Produit produit);

    public List<Produit> findAll();

    public void delete(Long idProduit);

    public Produit findOneById(Long idProduit);

    public void update(Produit produit);

    public List<Produit> findByName(String search);
}
