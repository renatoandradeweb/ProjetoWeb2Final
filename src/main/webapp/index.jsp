<%-- 
    Document   : index
    Created on : Feb 27, 2020, 8:44:43 AM
    Author     : renatoandrade.com
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="${request.getContextPath}/WEB-INF/jsp/top.jsp" />
<main role="main">

  <!-- Main jumbotron for a primary marketing message or call to action -->
  <div class="jumbotron">
    <div class="container">
      <h1 class="display-3">Seja bem-vindo!</h1>
      <p>Sistema de gestão de veículos com vRaptor</p>
      
      <!-- <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more &raquo;</a></p> -->
    </div>
  </div>


</main>


<jsp:include page="${request.getContextPath}/WEB-INF/jsp/scriptsjs.jsp" />
<jsp:include page="${request.getContextPath}/WEB-INF/jsp/rodape.jsp" />
</html>
