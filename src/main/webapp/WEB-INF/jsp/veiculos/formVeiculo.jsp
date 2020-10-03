<%-- 
    Document   : formVeiculo
    Created on : 25/05/2020, 21:58:32
    Author     : Lidiane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="${request.getContextPath}/WEB-INF/jsp/top.jsp" />
     
            <div class="container mt-5 p-3">
                <h4 class="w-auto p-3">Cadastro de Veículos</h4>

                <!--Validação do Vraptor com Bootstrap-->
                <c:forEach var="error" items="${errors}">
                    <div class="alert bg-danger text-white" role="alert">
                        ${error.category} - ${error.message}<br />
                    </div>
                </c:forEach>

                <form id="formulario" class="needs-validation" novalidate action="${linkTo[VeiculosController].salvar}" method="POST">
                    <div class="form-row">
                        <div class="col-md-4 mb-3">
                            <input type="hidden" name="veiculo.id" value="${veiculo.id}"/>
                            <label for="marcaid">Marca</label>
                            <input  type="text" class="form-control" id="marcaid" name="veiculo.marca" value="${veiculo.marca}" required>
                            <div class="valid-feedback">Válido!</div>
                            <div class="invalid-feedback">Inválido!</div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="modeloid">Modelo</label>
                            <input type="text" class="form-control" id="modeloid" 
                                   name="veiculo.modelo" value="${veiculo.modelo}" required>
                            <div class="valid-feedback">Válido!</div>
                            <div class="invalid-feedback">Inválido!</div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="tipoid">Tipo</label>
                            <input type="text" class="form-control" id="tipoid" 
                                   name="veiculo.tipo" value="${veiculo.tipo}" required>
                            <div class="valid-feedback">Válido!</div>
                            <div class="invalid-feedback">Inválido!</div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-4 mb-3">
                            <label for="anoid">Ano</label>
                            <input type="text" class="form-control" id="anoid" name="veiculo.ano" value="${veiculo.ano}" required>
                            <div class="valid-feedback">Válido!</div>
                            <div class="invalid-feedback">Inválido!</div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="placaid">Placa</label>
                            <input type="text" class="form-control" id="placaid" name="veiculo.placa" value="${veiculo.placa}" required>
                            <div class="valid-feedback">Válido!</div>
                            <div class="invalid-feedback">Inválido!</div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="validationCustom06">Valor da Diária</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroupPrepend">R$</span>
                                </div>
                                <input type="text" class="form-control" id="validationCustom06" name="veiculo.valorDiaria" value="${veiculo.valorDiaria}" required>
                               <div class="valid-feedback">Válido!</div>
                            <div class="invalid-feedback">Inválido!</div>
                            </div>
                        </div>
                    </div>
                    <button class="btn btn-success btn-block w-auto p-2 d-block mr-0 ml-auto" type="submit">Salvar</button>
                    </div>
                </form>  
        </div> <!-- Teste -->
    
   
    <jsp:include page="${request.getContextPath}/WEB-INF/jsp/scriptsjs.jsp" />
    <script>
                (function (){
                    var form =  document.getElementById("formulario");
                    form.addEventListener("submit",function (){
                        form["validationCustom06"].value = form["validationCustom06"].value.replace(".",","); 
                    });
                })();
            </script>  
<jsp:include page="${request.getContextPath}/WEB-INF/jsp/rodape.jsp" />

</html>
