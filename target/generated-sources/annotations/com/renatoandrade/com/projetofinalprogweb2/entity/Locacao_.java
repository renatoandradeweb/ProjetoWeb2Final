package com.renatoandrade.com.projetofinalprogweb2.entity;

import com.renatoandrade.com.projetofinalprogweb2.entity.Cliente;
import com.renatoandrade.com.projetofinalprogweb2.entity.Veiculo;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-10-02T11:28:30")
@StaticMetamodel(Locacao.class)
public class Locacao_ { 

    public static volatile SingularAttribute<Locacao, Veiculo> veiculo;
    public static volatile SingularAttribute<Locacao, Cliente> cliente;
    public static volatile SingularAttribute<Locacao, Date> dataFim;
    public static volatile SingularAttribute<Locacao, Integer> quantDiarias;
    public static volatile SingularAttribute<Locacao, Integer> id;
    public static volatile SingularAttribute<Locacao, Date> dataInicio;

}