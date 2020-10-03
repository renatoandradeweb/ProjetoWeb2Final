package com.renatoandrade.com.projetofinalprogweb2.entity;

import com.renatoandrade.com.projetofinalprogweb2.entity.Locacao;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-10-02T11:28:30")
@StaticMetamodel(Cliente.class)
public class Cliente_ { 

    public static volatile SingularAttribute<Cliente, String> telefone;
    public static volatile SingularAttribute<Cliente, String> nome;
    public static volatile SingularAttribute<Cliente, Integer> id;
    public static volatile ListAttribute<Cliente, Locacao> locacoes;

}