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
            usuarioInicial = us
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
        usuarioFinal = usuario
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

def listarMovimientos(movimientos):
    print("\nHistorial de movimientos:\n")
    contador = 1
    for mov in movimientos:
        if mov[2] == 2:
            datos = "{0}. {1} - Se consultó la lista de usuarios\n"
            print(datos.format(contador, mov[1])) 
        else:    
            if mov[2] == 1:
                datos = "{0}. {1} - Se creó el usuario --> ID: {2} | Username: {3} | Contraseña: {4} | Email: {5} | Nombre: {6} | Apellido: {7} | Telefono: {8} | Direccion: {9} | idProvincia: {10} | idDepartamento: {11}\n"
            elif mov[2] == 3:
                datos = "{0}. {1} - Se actualizó el usuario --> ID: {2} | Username: {3} | Contraseña: {4} | Email: {5} | Nombre: {6} | Apellido: {7} | Telefono: {8} | Direccion: {9} | idProvincia: {10} | idDepartamento: {11}\n"        
            elif mov[2] == 4:
                datos = "{0}. {1} - Se eliminó el usuario --> ID: {2} | Username: {3} | Contraseña: {4} | Email: {5} | Nombre: {6} | Apellido: {7} | Telefono: {8} | Direccion: {9} | idProvincia: {10} | idDepartamento: {11}\n"
            print(datos.format(contador, mov[1], mov[3], mov[4], mov[5], mov[6], mov[7], mov[8], mov[9], mov[10], mov[11], mov[12]))      
        contador += 1   

