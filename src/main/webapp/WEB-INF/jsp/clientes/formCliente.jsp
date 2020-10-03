<%-- 
    Document   : formCliente
    Created on : 25/05/2020, 21:53:11
    Author     : Lidiane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="${request.getContextPath}/WEB-INF/jsp/top.jsp" />
     
    <div class="container mt-5 p-3">
                <h4 class="w-auto p-3">Cadastro de Clientes</h4>

                <!--Validação do Vraptor com Bootstrap-->
                <c:forEach var="error" items="${errors}">
                    <div class="alert alert-danger" role="alert">
                        ${error.category} - ${error.message}<br />
                    </div>
                </c:forEach>

                <form class="needs-validation" novalidate action="${linkTo[ClientesController].salvar}" method="POST">
                    <div class="form-row">
                        <div class="col-md-6 mb-3">
                            <input type="hidden" name="cliente.id" value="${cliente.id}"/>
                            <label for="nomeid">Nome</label>
                            <input type="text" class="form-control" id="nomeid" name="cliente.nome" value="${cliente.nome}" required>
                            <div class="valid-feedback">Válido!</div>
                            <div class="invalid-feedback">Inválido!</div>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label for="telefoneid">Telefone</label>
                            <input type="text" class="form-control" id="telefoneid" maxlength="15" name="cliente.telefone"  value="${cliente.telefone}" placeholder="(99) 9999-9999"  required="required" pattern="\([0-9]{2}\) [0-9]{4,6}-[0-9]{3,4}$" />
                            <div class="valid-feedback">Válido!</div>
                            <div class="invalid-feedback">
                                Digite o número corretamente!
                            </div>
                        </div>
                    </div>
                    <button class="btn btn-success btn-block w-auto p-2 d-block mr-0 ml-auto" type="submit">Salvar</button>
                </form>
           
        </div>

            
    <!--Scripts do Bootstrap-->
    <jsp:include page="${request.getContextPath}/WEB-INF/jsp/scriptsjs.jsp" />
    <script>
                // Bootstrap Example starter JavaScript for disabling form submissions if there are invalid fields
                (function () {
                    'use strict';
                    window.addEventListener('load', function () {
                        // Fetch all the forms we want to apply custom Bootstrap validation styles to
                        var forms = document.getElementsByClassName('needs-validation');
                        // Loop over them and prevent submission
                        var validation = Array.prototype.filter.call(forms, function (form) {
                            form.addEventListener('submit', function (event) {
                                if (form.checkValidity() === false) {
                                    event.preventDefault();
                                    event.stopPropagation();
                                }
                                form.classList.add('was-validated');
                            }, false);
                        });
                    }, false);
                })();
    
    
                /* Máscaras ER */
                function mascara(o, f) {
                    v_obj = o
                    v_fun = f
                    setTimeout("execmascara()", 1)
                }
                function execmascara() {
                    v_obj.value = v_fun(v_obj.value)
                }
                function mtel(v) {
                    v = v.replace(/\D/g, "");             //Remove tudo o que não é dígito
                    v = v.replace(/^(\d{2})(\d)/g, "($1) $2"); //Coloca parênteses em volta dos dois primeiros dígitos
                    v = v.replace(/(\d)(\d{4})$/, "$1-$2");    //Coloca hífen entre o quarto e o quinto dígitos
                    return v;
                }
                function id(el) {
                    return document.getElementById(el);
                }
                window.onload = function () {
                    id('telefoneid').onkeyup = function () {
                        mascara(this, mtel);
                    }
                }
            </script>
    
<jsp:include page="${request.getContextPath}/WEB-INF/jsp/rodape.jsp" />

</html>
