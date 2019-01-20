package gk.ngando.mycatalog.produit.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import gk.ngando.mycatalog.produit.business.IProduitBusiness;
import gk.ngando.mycatalog.produit.domain.Produit;

@Controller
public class ProduitController {

    @Autowired
    private IProduitBusiness business;

    @RequestMapping(value = "/produit/produits")
    private String produits(Model model) {
	model.addAttribute("produit", new Produit());
	model.addAttribute("produits", business.findAll());
	return "produit/produits";
    }

    @RequestMapping(value = "/produit/edit/{id}")
    public String edit(@PathVariable(value = "id") Long id, Model model) {
	model.addAttribute("produit", business.findOneById(id));
	model.addAttribute("produits", business.findAll());
	return "produit/edit";
    }

    @RequestMapping(value = "/produit/save")
    private String save(@Valid Produit produit, BindingResult bindingResult, Model model) {
	if (bindingResult.hasErrors())
	    return "produit/produits";
	if (produit.getIdProduit() == null) {
	    business.add(produit);
	} else {
	    business.update(produit);
	    model.addAttribute("messageSuccess", "produit mis à jour!");
	    return "produit/edit";
	}
	model.addAttribute("produit", new Produit());
	model.addAttribute("produits", business.findAll());
	return "redirect:/produit/produits";
    }

    @RequestMapping(value = "/produit/delete")
    public String delete(@RequestParam(value = "id") Long id, Model model) {
	business.delete(id);
	model.addAttribute("produit", new Produit());
	model.addAttribute("produits", business.findAll());
	return "redirect:/produit/produits";
    }

    @RequestMapping(value = "/produit/{search}")
    @ResponseBody
    public List<Produit> listProduits(@PathVariable(value = "search") String search) {
	return business.findByName(search);
    }

}
