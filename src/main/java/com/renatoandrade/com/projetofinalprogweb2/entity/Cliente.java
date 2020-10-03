/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.renatoandrade.com.projetofinalprogweb2.entity;

import com.renatoandrade.com.projetofinalprogweb2.validations.numeroTelefone;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

/**
 *
 * @author renatoandrade.com
 */
@Entity
@Table(name = "tb_cliente")
public class Cliente implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    
    @NotNull
    private String nome;
    
    @numeroTelefone
    @NotNull
    private String telefone;
    
    @OneToMany(mappedBy = "cliente")
    private List<Locacao> locacoes = new ArrayList();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public List<Locacao> getLocacoes() {
        return locacoes;
    }

    public void setLocacoes(List<Locacao> locacoes) {
        this.locacoes = locacoes;
    }
}
