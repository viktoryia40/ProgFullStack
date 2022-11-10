def listarUsuarios(usuarios):
    print("\nUsuarios: \n")
    contador = 1
    for us in usuarios:
        datos = "{0}. ID: {1} | Username: {2} | Contraseña: {3} | Email: {4} | Nombre: {5} | Apellido: {6} | Telefono: {7} | Direccion: {8} | Provincia: {9} | idDepartamento: {10}"
        print(datos.format(contador, us[0], us[1], us[2], us[3], us[4], us[5], us[6], us[7], us[8], us[9]))
        contador = contador + 1
    print(" ")

def pedirDatosRegistro():
    username = input("Ingrese su nombre de usuario: ")
    contraseña = input("Ingrese su contraseña: ")
    email = input("Ingrese su correo electronico: ")
    nombre = input("Ingrese su nombre: ")
    apellido = input("Ingrese su apellido: ")
    telefono = int(input("Ingrese su numero de telefono: "))
    direccion = input("Ingrese su direccion: ")
    idProvincia = int(input("Ingrese numero de provincia: "))
    idDepartamento = int(input("Ingrese numero de departamento "))

    usuario = (username, contraseña, email, nombre, apellido, telefono, direccion, idProvincia, idDepartamento)
    return usuario

def pedirDatosActualizacion(usuarios):
    listarUsuarios(usuarios)
    existeId = False
    usuarioEditar = int(input("Ingrese id del usuario a editar: "))
    for us in usuarios:
        if us[0] == usuarioEditar:
            existeId = True
            break

    if existeId:
        username = input("Ingrese su nombre de usuario a modificar: ")
        contraseña = input("Ingrese su contraseña a modificar: ")
        email = input("Ingrese su correo electronico a modificar: ")
        nombre = input("Ingrese su nombre a modificar: ")
        apellido = input("Ingrese su apellido a modificar: ")
        telefono = int(input("Ingrese su numero de telefono a modificar: "))
        direccion = input("Ingrese su direccion a modificar: ")
        idProvincia = int(input("Ingrese numero de provincia a modificar: "))
        idDepartamento = int(input("Ingrese numero de departamento a modificar: "))

        usuario = (usuarioEditar, username, contraseña, email, nombre, apellido, telefono, direccion, idProvincia, idDepartamento)
    else:
        usuario = None

    return usuario


def pedirDatosEliminar(usuarios):
    listarUsuarios(usuarios)
    existeId = False
    usuarioEliminar = int(input("Ingrese id del usuario a eliminar: "))
    for us in usuarios:
        if us[0] == usuarioEliminar:
            existeId = True
            break
    if not existeId:
        usuarioEliminar = ""

    return usuarioEliminar


