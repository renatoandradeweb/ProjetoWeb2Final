<%-- 
    Document   : formLocacao
    Created on : 25/05/2020, 22:02:52
    Author     : Lidiane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<jsp:include page="${request.getContextPath}/WEB-INF/jsp/top.jsp" />
     
    <div class="container mt-5 p-3">
                <h4 class="w-auto p-3">Cadastro de Locação</h4>

                <!--Validação do Vraptor com Bootstrap-->
                <c:forEach var="error" items="${errors}">
                    <div class="alert bg-danger text-white" role="alert">
                        ${error.category} - ${error.message}<br />
                    </div>
                </c:forEach>

                <form class="needs-validation" novalidate action="${linkTo[LocacoesController].salvar}" method="POST">
                    <div class="form-row">
                        <div class="col-md-6 mb-3">
                            <input type="hidden" name="locacao.id" value="${locacao.id}"/>
                            <label for="validationCustom01">Cliente</label>
                            <select class="custom-select" id="validationCustom01" required name="locacao.cliente.id" value="${locacao.cliente.id}">
                                <option selected disabled value="">Escolha...</option>
                                <c:forEach items="${listaCliente}" var="cliente">
                                    <option  
                                        <c:if test="${cliente.id == locacao.cliente.id}" >selected</c:if> value="${cliente.id}" >${cliente.nome}
                                    </option>
                                </c:forEach>
                            </select>
                            <div class="valid-feedback">Válido!</div>
                            <div class="invalid-feedback">Inválido!</div>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label for="validationCustom02">Veículo</label>
                            <select class="custom-select" id="validationCustom02" name="locacao.veiculo.id" value="${locacao.veiculo.id}" required>
                                <option  value="">Escolha...</option>
                                <c:forEach items="${listaVeiculo}" var="veiculo">
                                    <option 
                                        <c:if test="${veiculo.id == locacao.veiculo.id}">selected</c:if>  
                                        value="${veiculo.id}">  ${veiculo.modelo}
                                    </option>
                                </c:forEach>
                            </select>
                            <div class="valid-feedback">Válido!</div>
                            <div class="invalid-feedback">Inválido!</div>
                        </div>

                    </div>

                    <div class="form-row">
                        <div class="col-md-6 mb-3">
                            <label for="validationCustom04">Data de Início</label>
                            <fmt:formatDate var="dataInicio" value="${locacao.dataInicio}" dateStyle="medium" />
                            <input type="text" class="form-control" id="validationCustom04" OnKeyUp="mascara_data(this)" maxlength="10" placeholder="dd/mm/aaaa" pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}" name="locacao.dataInicio" value="${dataInicio}" required>
                            <div class="valid-feedback">Válido!</div>
                            <div class="invalid-feedback">Inválido!</div>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label for="validationCustom05">Data de Fim</label> 
                            <fmt:formatDate var="dataFim" value="${locacao.dataFim}"  pattern="dd/MM/yyyy" /> 
                            <input type="text" class="form-control" id="validationCustom05" OnKeyUp="mascara_data(this)" maxlength="10" placeholder="dd/mm/aaaa" pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}" name="locacao.dataFim" value="${dataFim}" required>
                            <div class="valid-feedback">Válido!</div>
                            <div class="invalid-feedback">Inválido!</div>
                        </div>

                        <button class="btn btn-success btn-block w-auto p-2 d-block mr-0 ml-auto" type="submit">Salvar</button>
                    </div>
                </form>
            
        </div>

<jsp:include page="${request.getContextPath}/WEB-INF/jsp/scriptsjs.jsp" />
    <script>
        function mascara_data(elemento) {
            var data = elemento.value;
            var mydata = '';
            mydata = mydata + data;
            if (mydata.length == 2) {
                mydata = mydata + '/';
                elemento.value = mydata;
            }
            if (mydata.length == 5) {
                mydata = mydata + '/';
                elemento.value = mydata;
            }
            if (mydata.length == 10) {
                verifica_data();
            }
        }

        function verifica_data() {

            dia = (elemento.value.substring(0, 2));
            mes = (elemento.value.substring(3, 5));
            ano = (elemento.value.substring(6, 10));

            situacao = "";
            // verifica o dia valido para cada mes 
            if ((dia < 01) || (dia < 01 || dia > 30) && (mes == 04 || mes == 06 || mes == 09 || mes == 11) || dia > 31) {
                situacao = "falsa";
            }

            // verifica se o mes e valido 
            if (mes < 01 || mes > 12) {
                situacao = "falsa";
            }

            // verifica se e ano bissexto 
            if (mes == 2 && (dia < 01 || dia > 29 || (dia > 28 && (parseInt(ano / 4) != ano / 4)))) {
                situacao = "falsa";
            }

            if (elemento.value == "") {
                situacao = "falsa";
            }

            if (situacao == "falsa") {
                alert("Data inválida!");
                elemento.focus();
            }
        }

    </script>
  <jsp:include page="${request.getContextPath}/WEB-INF/jsp/rodape.jsp" />
</html>
