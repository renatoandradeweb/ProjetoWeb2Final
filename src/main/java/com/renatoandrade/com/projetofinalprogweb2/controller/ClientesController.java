/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.renatoandrade.com.projetofinalprogweb2.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import com.renatoandrade.com.projetofinalprogweb2.dao.ClienteDao;
import com.renatoandrade.com.projetofinalprogweb2.entity.Cliente;
import java.util.List;
import javax.inject.Inject;
import javax.validation.constraints.NotNull;
/**
 *
 * @author renatoandrade.com
 */
@Controller
public class ClientesController {
    @Inject
    ClienteDao clienteDao;

    @Inject
    Result result;

    @Inject
    Validator validator;
    
    public void formCliente() {
    }

    public List<Cliente> listaClientes() {

        return clienteDao.buscarClientes();
    }

    public void salvar(@NotNull Cliente cliente) {
        validator.validate(cliente);
        validator.onErrorRedirectTo(this).formCliente();

        if (cliente.getId() == null) {
            clienteDao.add(cliente);
        } else {
            clienteDao.update(cliente);
        }
        result.redirectTo(this).listaClientes();

    }

    public void editar(int id) {
        Cliente cliente = clienteDao.buscarCliente(id);
        result.include(cliente);
        result.of(this).formCliente();
    }

    public void excluir(Integer id) {
        clienteDao.deletar(id);
        result.redirectTo(this).listaClientes();
    }
}
