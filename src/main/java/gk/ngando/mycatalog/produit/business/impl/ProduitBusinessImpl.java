package gk.ngando.mycatalog.produit.business.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import gk.ngando.mycatalog.produit.business.IProduitBusiness;
import gk.ngando.mycatalog.produit.dao.IProduitDAO;
import gk.ngando.mycatalog.produit.domain.Produit;

public class ProduitBusinessImpl implements IProduitBusiness {

    private IProduitDAO dao;

    public void setDao(IProduitDAO dao) {
	this.dao = dao;
    }

    @Override
    @Transactional
    public void add(Produit produit) {
	dao.add(produit);
    }

    @Override
    public List<Produit> findAll() {
	return dao.findAll();
    }

    @Override
    @Transactional
    public void delete(Long idProduit) {
	dao.delete(idProduit);
    }

    @Override
    public Produit findOneById(Long idProduit) {
	return dao.findOneById(idProduit);
    }

    @Override
    @Transactional
    public void update(Produit produit) {
	dao.update(produit);
    }

    @Override
    @Transactional
    public List<Produit> findByName(String search) {
	return dao.findByName(search);
    }

}
