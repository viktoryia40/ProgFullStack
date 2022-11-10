from conexion import Conectar
import funciones

def menuPrincipal():
    continuar = True
    while(continuar):
        opcionCorrecta = False
        while(not opcionCorrecta):
            print("================== MENU =====================")
            print("1.- Listar usuarios")
            print("2.- Registrar usuario")
            print("3.- Actualizar usuario")
            print("4.- Eliminar usuario")
            print("5.- Salir")
            print("=============================================")
            opcion = int(input("Seleccione una opcion: "))

            if opcion < 1 or opcion > 5:
                print("Opcion incorrecta, ingrese nuevamente...")
            elif opcion == 5:
                continuar = False
                print("Gracias por usar este sistema!")
                break
            else:
                opcionCorrecta = True
                ejecutarOpcion(opcion)


def ejecutarOpcion(opcion):
    dao = Conectar()

    if opcion == 1:
        try:
            usuarios = dao.listarRegistros()
            if len(usuarios) > 0:
                funciones.listarUsuarios(usuarios)
            else:
                print("No se encontraron usuarios...")
        except:
            print("Ocurrio un error...")
    elif opcion == 2:
        usuario = funciones.pedirDatosRegistro()
        try:
            dao.registrarUsuario(usuario)
        except:
            print("Ocurrio un error...")
    elif opcion == 3:
        try:
            usuarios = dao.listarRegistros()
            if len(usuarios) > 0:
                usuario = funciones.pedirDatosActualizacion(usuarios)
                if usuario:
                    dao.actualizarUsuario(usuario)
                else:
                    print("Nombre de usuario a actualizar no encontrado... \n")
            else:
                print("No se encontraron usuarios...")
        except:
            print("Ocurrio un error...")
    elif opcion == 4:
        try:
            usuarios = dao.listarRegistros()
            if len(usuarios) > 0:
                usuarioEliminar = funciones.pedirDatosEliminar(usuarios)
                if not(usuarioEliminar == ""):
                    dao.eliminarUsuario(usuarioEliminar)
                else:
                    print("Usuario no encontrado... \n")
            else:
                print("No se encontraron usuarios...")
        except:
            print("Ocurrio un error...")
    else:
        print("Opcion no valida...")

menuPrincipal()