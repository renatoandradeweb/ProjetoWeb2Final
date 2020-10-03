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
import com.renatoandrade.com.projetofinalprogweb2.dao.LocacaoDao;
import com.renatoandrade.com.projetofinalprogweb2.dao.VeiculoDao;
import com.renatoandrade.com.projetofinalprogweb2.entity.Cliente;
import com.renatoandrade.com.projetofinalprogweb2.entity.Locacao;
import com.renatoandrade.com.projetofinalprogweb2.entity.Veiculo;
import java.util.List;
import javax.inject.Inject;
/**
 *
 * @author renatoandrade.com
 */
@Controller
public class LocacoesController {
    @Inject
    LocacaoDao locacaoDao;
    @Inject
    ClienteDao daoCliente;
    @Inject
    VeiculoDao daoVeiculo;
    @Inject
    Result result;
    @Inject
    Validator validator;
     
    public void formLocacao() {
        List<Cliente> listaClientes= daoCliente.buscarClientes();
        result.include("listaCliente", listaClientes);

        List<Veiculo> listaVeiculos = daoVeiculo.buscarVeiculos();
        result.include("listaVeiculo", listaVeiculos);
    }

    public List<Locacao> listaLocacoes() {
  
        return locacaoDao.buscarLocacoes();
    }

    public void salvar(Locacao locacao) {   
        validator.validate(locacao);
        validator.onErrorRedirectTo(this).formLocacao();
        
        if (locacao.getId() == null) {
            locacaoDao.add(locacao);
        } else {
            locacaoDao.update(locacao);
        }
        result.redirectTo(this).listaLocacoes();
    }

    public void editar(int id) {
        List<Cliente> listaClientes  = daoCliente.buscarClientes();
        result.include("listaCliente", listaClientes);

        List <Veiculo> listaVeiculos = daoVeiculo.buscarVeiculos();
        result.include("listaVeiculo", listaVeiculos);
        
        Locacao locacao = locacaoDao.buscarLocacao(id);
        
        result.include(locacao);   
        result.of(this).formLocacao();
    }

    public void excluir(Integer id) {

        locacaoDao.deletar(id);
        result.redirectTo(this).listaLocacoes();
    }
}
