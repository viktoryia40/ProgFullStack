import funciones
from conexion import Conectar


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
            print("5.- Listar historial de movimientos")
            print("6.- Salir")
            print("=============================================")
            opcion = int(input("Seleccione una opcion: "))

            if opcion < 1 or opcion > 6:
                print("Opcion incorrecta, ingrese nuevamente...")
            elif opcion == 6:
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
                dao.registrarMovimientoBD(2)
            else:
                print("No se encontraron usuarios...")
        except:
            print("Ocurrio un error...")
    elif opcion == 2:
        usuario = funciones.pedirDatosRegistro()
        try:
            dao.registrarUsuario(usuario)
            dao.registrarMovimientoBD(1, usuario)
        except:
            print("Ocurrio un error...")
    elif opcion == 3:
        try:
            usuarios = dao.listarRegistros()
            if len(usuarios) > 0:
                usuario = funciones.pedirDatosActualizacion(usuarios)
                if usuario:
                    dao.actualizarUsuario(usuario)
                    dao.registrarMovimientoBD(3, usuario)
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
                    for us in usuarios:
                        if us[0] == usuarioEliminar:
                            dao.registrarMovimientoBD(4, us)
                    dao.eliminarUsuario(usuarioEliminar)
                else:
                    print("Usuario no encontrado... \n")
            else:
                print("No se encontraron usuarios...")
        except:
            print("Ocurrio un error...")
    elif opcion == 5:
        try:
            movimientos = dao.obtenerMovimientos()
            if len(movimientos) > 0:
                funciones.listarMovimientos(movimientos)
            else:
                print("No se encontraron novimientos...")
        except:
            print("Ocurrió un error...")
    else:
        print("Opción no valida...")


menuPrincipal()