<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crud vRaptor</title>
        <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/jumbotron.css">
    </head>
    <body>
        
<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
  <a class="navbar-brand" href="#">CRUD vRaptor</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarsExampleDefault">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="${pageContext.servletContext.contextPath}">Home</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="${linkTo[VeiculosController].listaVeiculos}">Listagem de Veiculos</a>
      </li>
      
      <li class="nav-item active">
        <a class="nav-link" href="${linkTo[VeiculosController].formVeiculo}">Cadastrar Veiculo</a>
      </li>
      
      <li class="nav-item active">
        <a class="nav-link" href="${linkTo[ClientesController].listaClientes}">Listagem de Clientes</a>
      </li>
      
      <li class="nav-item active">
        <a class="nav-link" href="${linkTo[ClientesController].formCliente}">Cadastrar Cliente</a>
      </li>
      
      <li class="nav-item active">
        <a class="nav-link" href="${linkTo[LocacoesController].listaLocacoes}">Listagem de Locações</a>
      </li>
      
      <li class="nav-item active">
        <a class="nav-link" href="${linkTo[LocacoesController].formLocacao}">Cadastrar Locação</a>
      </li>
     
     
    </ul>
  
  </div>
</nav>
      
      
      