function validarLogin(){
    var correo, contraseña;

    correo = document.getElementById("email").value;
    contraseña = document.getElementById("password").value;
    expresion = /\w+@\w+\.+[a-z]/;
    
    if(correo === "" || contraseña === ""){
       alert("Hay campos vacios");
       return false;
    }
    else if(correo.length >60){
       alert("correo muy largo")
       return false;
    }
    else if(!expresion.test(correo)){
       alert("El correo no es válido")
 
    }
    else if(contraseña.length <8){
       alert("contraseña muy corta")
       return false;
    }
 }