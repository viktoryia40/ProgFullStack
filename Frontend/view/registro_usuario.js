const nombre = document.getElementById("nombre")
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
       warnings += 'El nombre no es válido <br>' 
       entrar = true
    }
    if(!regexEmail.test(email.Value)){
        warnings += 'El email no es válido <br>' 
        entrar = true
     }
     if(password.Value.length <8 ){
        warnings += 'La contraseña no es válido <br>' 
        entrar = true
     }
     if(entrar){
        parrafo.innerHTML = warnings
     } else{
        parrafo.innerHTML = "enviado"
     }
})