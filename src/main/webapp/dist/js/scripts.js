/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


(function () {
    var btn = document.getElementById("btn");
    btn.addEventListener("click", function () {
        var codigo = document.getElementById("codigo").value;
        if (codigo !== "")
            document.getElementById("formulario").action = "${linkTo[AlunosController].update}";
        else
            document.getElementById("formulario").action = "${linkTo[AlunosController].salvar}";
    });
})();
        