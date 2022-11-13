//Creación de clase producto para almacenar cada uno
class Producto{

    constructor(titulo, descripcion, precio){
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.precio = precio;
    }

}

//Busca en el archivo json los productos disponibles.

let showCards  = () =>{
    fetch('../view/js/productos.json')

    .then(response => response.json())

    .then((data) => {

        //Creo un array con los productos del archivo json y realizo un map para luego mostrarlo en el DOM.

        const arrayProducts = Object.values(data);

        arrayProducts.map( (element) =>{

            const title = element.nombre;

            const desc = element.descripcion;

            const price = element.precio;

            const img = element.imagen;

            const id = element.id;

            const product  = `
            <div class="card">
                <img src="${img}" class="card-img-top" id="img${id}" alt="${title}">
                <div class="card-body">
                    <h5 class="card-title">${title}</h5>
                    <p class="card-text">${desc}</p>
                    <p class="card-text">${price}</p>
                    <button class="btn btn-primary cart-add" id="${id}" onclick="cartAdd(this.id)">Añadir al carrito</button>
                </div>
            </div>
            `

            document.getElementById("container").innerHTML += product;
            
        })
    })
}

//Toma los productos seleccionados y los reserva en localStorage, para luego recuperarlos en el carrito.

let cartAdd = (id) =>{

    let price = document.getElementById(id).previousElementSibling;
    let desc = price.previousElementSibling;
    let title = desc.previousElementSibling;

    let producto =
        new Producto(
            title.innerHTML,
            desc.innerHTML,
            price.innerHTML
        )
    
    productos.push(producto);

    localStorage.setItem("productos", JSON.stringify(productos));
    
}

//Actualiza el array productos con el contenido de localStorage.

let productos = JSON.parse(localStorage.getItem("productos") || "[]");

showCards();


