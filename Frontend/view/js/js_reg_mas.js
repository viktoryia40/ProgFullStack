function validar(){
    let nombre=document.getElementById("nombre").value;
    if(nombre.length==0 || /^\s+$/.test(nombre)){
        alert("Complete su Nombre y Apellido, por favor");
        return false;
    }
    let email=document.getElementById("email").value;
    if(email.length==0 || /^\s+$/.test(email)){
        alert("Complete el email, por favor");
        return false;
    }
    let registro=document.getElementById("registro").value;
    if (registro.length==""){
        alert("Elija una opción, por favor")
        return false;
    }
    let especie=document.getElementsByClassName("especie").value;
    let raza=document.getElementById("raza").value;
    let foto=document.getElementById("foto").value;
    let descripcion=document.getElementById("descripcion").value;
    console.log(nombre);
    console.log(email);
    console.log(registro);
    console.log(especie);
    console.log(raza);
    console.log(foto);
    console.log(descripcion);
}
    