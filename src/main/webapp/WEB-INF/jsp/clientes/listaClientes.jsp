<%-- 
    Document   : listaClientes
    Created on : Sep 29, 2020, 11:56:03 PM
    Author     : renatoandrade.com
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <jsp:include page="${request.getContextPath}/WEB-INF/jsp/top.jsp" />
    
      <div class="container">
        <br>
        <h1>Lista de Clientes</h1>
        <br>
        
        <!-- Buscar dados enviados pelo VeiculosController -->
        
        <table class="table table-striped">
            <thead>
              <tr>  
                  <th scope="col">ID</th>
                    <th scope="col">Nome</th>
                    <th scope="col">Telefone</th>
                    <th scope="col" colspan="2">Opções</th>
                </tr>
            </thead>
            <tbody>
        
            <c:forEach items="${clienteList}" var="client">
                    <tr>
                        <td>${client.id}</td>
                        <td>${client.nome}</td>
                        <td>${client.telefone}</td>
                        <td> 
                               <a href="${linkTo[ClientesController].excluir}?id=${client.id}" onclick="return confirm('Você deseja excluir o cliente ${client.nome} ?');"
                               class="btn btn-danger btn-block" role="button">Excluir
                            </a> 
                        </td>
                        <td> 
                            <a href="${linkTo[ClientesController].editar}?id=${client.id}"  
                               class="btn btn-primary btn-block" role="button">Editar
                            </a> 
                        </td> 
                    </tr>
             </c:forEach>
        </tbody>
        </table>
            <br>  
            <div class="row justify-content-end">
            <a class="btn btn-primary" href="${linkTo[ClientesController].formCliente}">Adicionar Cliente</a><br>
            </div>  
            <br><br><br>
    </div>


<jsp:include page="${request.getContextPath}/WEB-INF/jsp/scriptsjs.jsp" />
<jsp:include page="${request.getContextPath}/WEB-INF/jsp/rodape.jsp" />
</html>
