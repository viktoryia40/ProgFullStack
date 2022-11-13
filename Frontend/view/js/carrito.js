//Recuperar los productos almacenados en localStorage para mostrarlos en el carrito.
let showCart = () =>{

    let productos = JSON.parse(localStorage.getItem("productos") || "[]");

//Bucle for para recorrer el array de productos y mostrar cada uno en el DOM.

    for(let i = 0; i<productos.length; i++){
        let show =  `
        <div class="productos">
            <p class="producto">${productos[i].titulo}</p>
            <p class="precio">${productos[i].precio}</p>
            <div class="quantity--container">
                <input value="1" type="number" id="quan${i}" required min="1" max="10"></input>
                <button class="btn del" onclick="del(${i})">x</button>
            </div>
        </div>
        `

    document.getElementById("container--carrito").innerHTML+= show;
    }

//En caso de que el carrito esté vacío, se informa al usuario.

    if(productos.length === 0){
        document.getElementById("container--carrito").innerHTML = `
            <p class="cart">No hay productos en el carrito</p>
        `
        document.getElementById("fin").remove();
    }
}

//Borrar el producto seleccionado de la lista.

let del = (i) =>{

    let productos = JSON.parse(localStorage.getItem("productos") || "[]");

    productos.splice(i,1);

    localStorage.setItem("productos", JSON.stringify(productos));

    location.reload();
}

//Verificar que las cantidades sean correctas.

let finCompra = () =>{

    let productos = JSON.parse(localStorage.getItem("productos") || "[]");
    let cont = 0;
    for(let i = 0; i<productos.length; i++){
        let cantidad = [];
        cantidad [i] = document.getElementById(`quan${i}`).value;
        
        if((cantidad [i] <= 0) || (cantidad [i] > 10)){ 
            document.getElementById("fin--container").innerHTML = `   <span class="fin--span">Ingresa una cantidad entre 1 y 10.</span>
            <button class="btn fin" id="fin" onclick="finCompra()">Finalizar la compra</button>
        `}
        else{
            cont++;
        }
    }
    if(cont === (productos.length)){
        window.location.href = "../view/finalizaciondecompra.html";
    }
    }



//Botón finalizar compra.

let fin = document.getElementById("fin");

fin.addEventListener('click', finCompra);

showCart();
