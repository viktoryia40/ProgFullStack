
function mostrarFiltro(boton) {
    boton.className = "btn btn-primary botonOculto"
    let campos = document.querySelectorAll(".especializado")
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

function filtrar() {
    let campos = document.querySelectorAll("#filtros select")
    let valorSeleccionado = false
    for (i = 0; i < campos.length; i++) {
        if (campos[i].value != "") {
            valorSeleccionado = true
        }     
    }
    if (valorSeleccionado == false) {
        alert("Si desea utilizar los filtros, debe seleccionar al menos un criterio.")
    }
}

function validarForm() {
    let formulario = document.querySelector('#filtros')
    let campos = document.querySelectorAll("#filtros select")
    let valorSeleccionado = false
    formulario.addEventListener("submit", e=> {   
        for (i = 0; i < campos.length; i++) {
            console.log(campos[i].value);
            if (campos[i].value != "") {
                valorSeleccionado = true
            }     
        }
        console.log(valorSeleccionado);
        if (valorSeleccionado == false) {
            alert("Si desea utilizar los filtros, debe seleccionar al menos un criterio.")
            e.preventDefault()
        }
    })
}