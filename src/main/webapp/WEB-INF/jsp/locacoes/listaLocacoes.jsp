<%-- 
    Document   : listaLocacoes
    Created on : 25/05/2020, 22:04:29
    Author     : Lidiane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <jsp:include page="${request.getContextPath}/WEB-INF/jsp/top.jsp" />
    
      <div class="container">
        <br>
        <h1>Lista de Locações</h1>
        <br>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th colspan="7" style=" font-size: 20px">Lista de Locações</th>
                </tr>
            </thead>

            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Cliente</th>
                    <th scope="col">Carro</th>                    
                    <th scope="col">Data de Início</th>
                    <th scope="col">Data de Fim</th>
                    <th scope="col">Quantidade de Diárias</th>
                    <th scope="col" colspan="2">Opções</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${locacaoList}" var="locacao">
                    <tr>
                        <td>${locacao.id}</td>
                        <td>${locacao.cliente.nome}</td>
                        <td>${locacao.veiculo.modelo}</td>                        
                        <td> <fmt:formatDate value="${locacao.dataInicio}" type="date" pattern="dd/MM/yyyy" /></td>
                        <td> <fmt:formatDate value="${locacao.dataFim}" type="date" pattern="dd/MM/yyyy" /></td>
                        <td>${locacao.quantDiarias}</td> 
                        <td> 
                               <a href="${linkTo[LocacoesController].excluir}?id=${locacao.id}" onclick="return confirm('Você deseja excluir esse registro +${locacao.id}+ ?');"
                               class="btn btn-danger btn-block" role="button">Excluir
                            </a> 
                        </td>
                        <td> 
                            <a href="${linkTo[LocacoesController].editar}?id=${locacao.id}"  
                               class="btn btn-primary btn-block" role="button">Editar
                            </a> 
                        </td> 
                    </tr>
                </c:forEach>

                <tr>
                    
                </tr>
            </tbody>
        </table><br>
        
        <div class="row justify-content-end">
                    <a class="btn btn-primary" href="${linkTo[LocacoesController].formLocacao}">Adicionar Locação</a><br>
            </div>  
        <br><br><br>
    </div>

<jsp:include page="${request.getContextPath}/WEB-INF/jsp/scriptsjs.jsp" />
<jsp:include page="${request.getContextPath}/WEB-INF/jsp/rodape.jsp" />
</html>
