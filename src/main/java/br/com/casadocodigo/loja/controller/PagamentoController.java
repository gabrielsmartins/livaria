package br.com.casadocodigo.loja.controller;

import java.util.concurrent.Callable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.casadocodigo.loja.model.Carrinho;
import br.com.casadocodigo.loja.model.DadosPagamento;

@Controller
@RequestMapping(value="/pagamento", method=RequestMethod.POST)
public class PagamentoController {
	
	@Autowired
	private Carrinho carrinho;
	
	@Autowired
	private RestTemplate restTemplate;
	
	@RequestMapping("/finalizar")
	public Callable<ModelAndView> finalizar(RedirectAttributes model) {
		return () -> {
			String uri = "http://book-payment.herokuapp.com/payment";
			try {
				
				String response = restTemplate.postForObject(uri, new DadosPagamento(carrinho.getTotal()), String.class);
				System.out.println(response);
				model.addFlashAttribute("message", response);
				return new ModelAndView("redirect:/produtos");
			}catch(HttpClientErrorException e) {
				System.out.println(e.getMessage());
				model.addFlashAttribute("message", "Valor Maior Que o Permitido");
				return new ModelAndView("redirect:/produtos");
			}
		};

	}

}
