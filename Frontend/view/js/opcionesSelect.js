document.body.onload = async function getProvincias() {
    const apiUrl = 'https://apis.datos.gob.ar/georef/api/provincias'
    opciones(apiUrl, "provincias")
}    

async function getDepartamentos() {
    let id = document.querySelector('.provincias').value
    const apiUrl2 = `https://apis.datos.gob.ar/georef/api/departamentos?provincia=${id}&campos=id,nombre&max=150`
    opciones(apiUrl2, "departamentos")
}

async function opciones(apiUrl, divisionTerritorial) {
    try {
        const response = await fetch(apiUrl)
        const data = await response.json()
        let opciones = []
        for (i = 0; i < data.total; i++) {
            opciones.push({id:data[divisionTerritorial][i].id, nombre:data[divisionTerritorial][i].nombre})
        }
        opciones.sort((a, b) => {
            if (a.nombre < b.nombre) {
                return -1;
            } else if (a.nombre > b.nombre) {
                return 1;
            } else {
                return 0;
            }})
        const campoSelect = document.querySelector(`.${divisionTerritorial}`)
        campoSelect.disabled = false
        campoSelect.innerHTML = `
        <option value="" selected>${divisionTerritorial[0].toUpperCase() + divisionTerritorial.substring(1,divisionTerritorial.length-1)}</option>
        ${opciones.map((value) => {
            if (value.nombre.length > 15) {
                return `<option value="${value.id}" title="${value.nombre}">${value.nombre.substring(0, 14) + "..."}</option>`
            } else {
                return `<option value="${value.id}">${value.nombre}</option>`
            }})
        }`
    } 
    catch(error) {console.log("Ocurrió un error grave", error)}  
}

function getRazas() {
    let selectEspecie = document.querySelector(".especie").value
    let selectRaza = document.querySelector("#raza")
    selectRaza.disabled = false
    let opciones = []
    if (selectEspecie == "1") {
        opciones = [{id:'1', nombre:'Mestizo'}, {id:'2', nombre:'Beagle'}, {id:'3', nombre:'Boxer'}, {id:'4', nombre:'Bulldog'}, 
        {id:'5', nombre:'Bulldog francés'}, {id:'6', nombre:'Caniche'}, {id:'7', nombre:'Golden retriever'}, {id:'8', nombre:'Labrador retriever'}, 
        {id:'9', nombre:'Pastor alemán'}, {id:'10', nombre:'Salchicha'}, {id:'11', nombre:'Schnauzer'}, {id:'12', nombre:'Otro'}]     
    } else if (selectEspecie == "2") {
        opciones = [{id:'1', nombre:'Mestizo'}, {id:'13', nombre:'Angora turco'}, {id:'14', nombre:'Azul ruso'}, {id:'15', nombre:'Bengalí'},
        {id:'16', nombre:'Maine Coon'}, {id:'17', nombre:'Persa'}, {id:'18', nombre:'Siamés'}, {id:'19', nombre:'Siberiano'}, {id:'12', nombre:'Otro'}]
    } else {
        selectRaza.disabled = true
    }      
    selectRaza.innerHTML = `
    <option value="" selected>Raza</option>
    ${opciones.map((value) => {
        return (
                `<option value="${value.id}">${value.nombre}</option>`
                )
        })
    }`
}

