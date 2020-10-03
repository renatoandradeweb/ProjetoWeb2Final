/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.renatoandrade.com.projetofinalprogweb2.dao;

import com.renatoandrade.com.projetofinalprogweb2.entity.Locacao;
import java.util.List;
import javax.enterprise.context.Dependent;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;

/**
 *
 * @author renatoandrade.com
 */
@Dependent
public class LocacaoDao {
    @Inject
    EntityManager manager;
    
    /**
     * Método para adicionar locacao
     * @param locacao
     * @return 
     */
    public boolean add(Locacao locacao) {

        try {
            manager.getTransaction().begin();
            manager.persist(locacao);
            manager.getTransaction().commit();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }
    
    /**
     * Método para retornar uma locacao pelo ID.
     * @param id
     * @return 
     */
    public Locacao buscarLocacao(int id) {
        try {
            Locacao locacao = manager.find(Locacao.class, id);
            return locacao;

        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    /**
     * Método para retornar uma lista de locacoes.
     * @return 
     */
    public List<Locacao> buscarLocacoes() {
        Query query = manager.createQuery("from Locacao");
        List<Locacao> locacoes = query.getResultList();

        //Retorna a lista de locacoes
        return locacoes;
    }
    
    /**
     * Método para update dados locacao
     * @param locacao
     * @return
     */
    public boolean update(Locacao locacao) {
        try {
            manager.getTransaction().begin();
            manager.merge(locacao);
            manager.getTransaction().commit();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }
    /**
     * Método para excluir uma locacao pelo ID.
     * @param id
     * @return 
     */
    public boolean deletar(int id) {
        try {
            manager.getTransaction().begin();
            Locacao locacao = manager.find(Locacao.class, id);
            manager.remove(locacao);
            manager.getTransaction().commit();
            return false;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }
}
