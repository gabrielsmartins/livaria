package br.com.casadocodigo.loja.dao;



import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.casadocodigo.loja.model.Produto;

@Repository
@Transactional
public class ProdutoDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void store(Produto produto) {
		manager.persist(produto);
	}

	public List<Produto> list() {
		TypedQuery<Produto> query = manager.createQuery("select p from Produto p",Produto.class);
		return query.getResultList();
	}

	public Produto find(Integer id) {
		return manager.createQuery("select distinct(p) from Produto p "
				+ "join fetch p.precos precos where p.id = :pId", Produto.class)
				.setParameter("pId", id)
				.getSingleResult();
	}

}
