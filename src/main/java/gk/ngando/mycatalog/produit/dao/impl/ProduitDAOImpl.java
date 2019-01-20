package gk.ngando.mycatalog.produit.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import gk.ngando.mycatalog.produit.dao.IProduitDAO;
import gk.ngando.mycatalog.produit.domain.Produit;

public class ProduitDAOImpl implements IProduitDAO {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public void add(Produit produit) {
	entityManager.persist(produit);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Produit> findAll() {
	Query req = entityManager.createQuery("SELECT p FROM Produit p");
	return req.getResultList();
    }

    @Override
    public void delete(Long idProduit) {
	Produit produit = entityManager.find(Produit.class, idProduit);
	entityManager.remove(produit);
    }

    @Override
    public Produit findOneById(Long idProduit) {
	Produit produit = entityManager.find(Produit.class, idProduit);
	return produit;
    }

    @Override
    public void update(Produit produit) {
	entityManager.merge(produit);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Produit> findByName(String search) {
	Query request = entityManager.createQuery("SELECT p FROM Produit p WHERE p.nomProduit LIKE :x");
	request.setParameter("x", "%" + search + "%");
	return request.getResultList();
    }

}
