<%-- 
    Document   : lista
    Created on : Feb 6, 2020, 11:21:05 AM
    Author     : renatoandrade.com
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <jsp:include page="${request.getContextPath}/WEB-INF/jsp/top.jsp" />
    
      <div class="container">
        <br>
        <h1>Lista de Veiculos</h1>
        <br>
        
        <!-- Buscar dados enviados pelo VeiculosController -->
        
        <table class="table table-striped">
            <thead>
              <tr>
                <th scope="col">ID</th>
                  <th scope="col">Marca</th>
                    <th scope="col">Modelo</th>
                    <th scope="col">Tipo</th>
                    <th scope="col">Ano</th>
                    <th scope="col">Placa</th>
                    <th scope="col">Valor da Diária</th>
                    <th scope="col" colspan="2">Opções</th>
              </tr>
            </thead>
            <tbody>
        
            <c:forEach items="${veiculoList}" var="veiculo">

                <tr>
                
                        <th scope="row">${veiculo.id}</th>
                        <td>${veiculo.marca}</td>
                        <td>${veiculo.modelo}</td>
                        <td>${veiculo.tipo}</td>
                        <td>${veiculo.ano}</td>
                        <td>${veiculo.placa}</td>
                        <td>${veiculo.valorDiaria}</td>
                        <td> 
                            <a href="${linkTo[VeiculosController].excluir}?id=${veiculo.id}" onclick="return confirm('Você deseja excluir o veiculo ${veiculo.modelo} ?');"
                               class="btn btn-danger btn-block" role="button">Excluir
                            </a> 
                        </td>
                        <td> 
                            <a href="${linkTo[VeiculosController].editar}?id=${veiculo.id}"  
                               class="btn btn-primary btn-block" role="button">Editar
                            </a> 
                        </td> 
                 </tr>

            </c:forEach>
        </tbody>
        </table>
            <br>  
            <div class="row justify-content-end">
            <a class="btn btn-primary" href="${linkTo[VeiculosController].formVeiculo}">Adicionar Veiculo</a><br>
            </div>  
            <br><br><br>
    </div>


<jsp:include page="${request.getContextPath}/WEB-INF/jsp/scriptsjs.jsp" />
<jsp:include page="${request.getContextPath}/WEB-INF/jsp/rodape.jsp" />
</html>
