function validarFormulario(){
    let envio=document.getElementById("envio").value;
    if (envio.length==""){
        alert("Elija una opción de envío, por favor")
        return false;
    }
    let direccion=document.getElementById("direccion").value;
    if(direccion.length==0 || /^\s+$/.test(direccion)){
        alert("Complete Dirección, por favor");
        return false;
    }
    let codigopostal=document.getElementById("codigopostal").value;
    if(codigopostal.length==0 || /^\s+$/.test(codigopostal)){
        alert("Complete el código postal, por favor");
        return false;
    }
    let localidad=document.getElementById("localidad").value;
    if (localidad.length==0 || /^\s+$/.test(localidad)){
        alert("Elija una localidad, por favor")
        return false;
    }
    let provincia=document.getElementById("provincia").value;
    if (provincia.length==0 || /^\s+$/.test(provincia)){
        alert("Elija una provincia, por favor")
        return false;
    }
    let pago=document.getElementById("pago").value;
    if (pago.length==""){
        alert("Elija una opción de pago, por favor")
        return false;
    console.log(envio);
    console.log(direccion);
    console.log(codigopostal);
    console.log(localidad);
    console.log(provincia);
    console.log(pago);
}
}
