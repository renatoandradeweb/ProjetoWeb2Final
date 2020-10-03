/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.renatoandrade.com.projetofinalprogweb2.dao;

import com.renatoandrade.com.projetofinalprogweb2.entity.Cliente;
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
public class ClienteDao {
    @Inject
    EntityManager manager;
    
    /**
     * Método para adicionar cliente
     * @param cliente
     * @return 
     */
    public boolean add(Cliente cliente) {

        try {
            manager.getTransaction().begin();
            manager.persist(cliente);
            manager.getTransaction().commit();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }
    
    /**
     * Método para retornar um cliente pelo ID.
     * @param id
     * @return 
     */
    public Cliente buscarCliente(int id) {
        try {
            Cliente cliente = manager.find(Cliente.class, id);
            return cliente;

        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    /**
     * Método para retornar uma lista de clientes.
     * @return 
     */
    public List<Cliente> buscarClientes() {
        Query query = manager.createQuery("from Cliente");
        List<Cliente> clientes = query.getResultList();

        //Retorna a lista de Clientes
        return clientes;
    }
         
    /**
     * Método para update dados cliente
     * @param cliente
     * @return
     */
    public boolean update(Cliente cliente) {
        try {
            manager.getTransaction().begin();
            manager.merge(cliente);
            manager.getTransaction().commit();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }
    
    /**
     * Método para excluir um cliente pelo ID.
     * @param id
     * @return 
     */
    public boolean deletar(int id) {
        try {
            manager.getTransaction().begin();
            Cliente cliente = manager.find(Cliente.class, id);
            manager.remove(cliente);
            manager.getTransaction().commit();
            return false;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }
}
