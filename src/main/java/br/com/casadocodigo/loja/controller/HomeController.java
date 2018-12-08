package br.com.casadocodigo.loja.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.casadocodigo.loja.dao.ProdutoDAO;
import br.com.casadocodigo.loja.model.Produto;

@Controller
public class HomeController {
	
	@Autowired
	private ProdutoDAO produtoDAO;

	@RequestMapping("/")
	public ModelAndView index() {
		List<Produto> produtos = produtoDAO.list();
		ModelAndView modelAndView = new ModelAndView("home");
		modelAndView.addObject("produtos", produtos);
		return modelAndView;
	}
}
