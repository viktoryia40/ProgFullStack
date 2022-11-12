
function mostrarFiltro(boton) {
    boton.className = "btn btn-primary botonOculto"
    let campos = document.querySelectorAll(".especializado")
    console.log(campos[0]);
    console.log(boton.id);
    if (boton.id == "btnFiltroEspecializado") {
        document.querySelector(".publicaciones h3").innerHTML = "Filtro especializado"
        document.querySelector("#btnFiltroRapido").className = "btn btn-primary"
        for (i = 0; i < campos.length; i++) {
            campos[i].className = "form-select especializado"
        }
    } else {
        document.querySelector(".publicaciones h3").innerHTML = "Filtro rápido"
        document.querySelector("#btnFiltroEspecializado").className = "btn btn-primary"
        for (i = 0; i < campos.length; i++) {
            campos[i].className = "form-select especializado selectOculto"
        }
    }  
}

