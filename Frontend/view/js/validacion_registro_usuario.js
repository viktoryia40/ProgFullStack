function validar(){
   var nombre, correo, contraseña;
   nombre = document.getElementById("nombre").value;
   telefono = document.getElementById("telefono").value;
   correo = document.getElementById("email").value;
   contraseña = document.getElementById("password").value;
   expresion = /\w+@\w+\.+[a-z]/;
   
   if(nombre === "" || telefono === "" || correo === "" || contraseña === ""){
      alert("Hay campos vacios");
      return false;
   }
   else if(nombre.length >25){
      alert("Nombre muy largo")
      return false;
   }
   else if(telefono.length >10){
      alert("El telefono es muy largo")
      return false;
   }
   else if(isNaN(telefono)){
      alert("El telefono ingresado no es un numero")
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















/*const nombre = document.getElementById("nombre")
const email = document.getElementById("email")
const password = document.getElementById("password")
const form = document.getElementById("form")
const parrafo = document.getElementById("warnings")

form.addEventListener("submit", e=>{
    e.preventDefault()

    let warnings=""
    let regexEmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
    let entrar= false
    parrafo.innerHTML = ""

    if(nombre.Value.length <6){
     warnings += "El nombre no es válido <br>" 
     //alert("completar el nombre con mas de 6 letras")
       entrar = true
    }
    if(!regexEmail.test(email.Value)){
       warnings += "El email no es válido <br>" 
       //alert("email invalido") 
       entrar = true
     }
     if(password.Value.length <8 ){
       warnings += "La contraseña no es válido <br>"
       //alert("colocar mas de 8 caracrteres ") 
       entrar = true
     }
     if(entrar){
        parrafo.innerHTML = warnings
     } else{
        parrafo.innerHTML = "enviado"
     }
})*/
