/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.renatoandrade.com.projetofinalprogweb2.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import com.renatoandrade.com.projetofinalprogweb2.dao.VeiculoDao;
import com.renatoandrade.com.projetofinalprogweb2.entity.Veiculo;
import java.util.List;
import javax.inject.Inject;
import javax.validation.constraints.NotNull;
/**
 *
 * @author renatoandrade.com
 */
@Controller
public class VeiculosController {
    @Inject
    VeiculoDao veiculoDao;

    @Inject
    Result result;

    @Inject
    Validator validator;
    
    public void formVeiculo() {
    }

    public List<Veiculo> listaVeiculos() {

        return veiculoDao.buscarVeiculos();
    }

    public void salvar(@NotNull Veiculo veiculo) {

        validator.validate(veiculo);

        validator.onErrorRedirectTo(this).formVeiculo();

        if (veiculo.getId() == null) {
            veiculoDao.add(veiculo);
        } else {
            veiculoDao.update(veiculo);
        }
        result.redirectTo(this).listaVeiculos();
    }

    public void editar(int id, Result result) {

        Veiculo veiculo = veiculoDao.buscarVeiculo(id);
        
        result.include(veiculo);
        result.of(this).formVeiculo();
    }

    public void excluir(Integer id, Result result) {

        veiculoDao.deletar(id);
        result.redirectTo(this).listaVeiculos();
    }
}
