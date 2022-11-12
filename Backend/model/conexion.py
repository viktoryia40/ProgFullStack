import mysql.connector
from mysql.connector import Error
from datetime import date
from datetime import datetime

class Conectar():

    def __init__(self):
        try:
            self.connexion = mysql.connector.connect(
                host = '127.0.0.1',
                port = 3306,
                user = 'root',
                password = 'Vane0889',
                db = 'mascotar'
            )
        except Error as ex:
            print("Error al intentar la conexion: {0}".format(ex))

    def listarRegistros(self):
        if self.connexion.is_connected():
            try:
                cursor = self.connexion.cursor()
                cursor.execute("SELECT * FROM usuario ORDER BY id ASC")
                resultados = cursor.fetchall()
                return resultados
            except Error as ex:
                print("Error al intentar la conexion: {0}".format(ex))

    def registrarUsuario(self, usuario):
        if self.connexion.is_connected():
            try:
                cursor = self.connexion.cursor()
                sql= "INSERT INTO usuario (username, contraseña, email, nombre, apellido, telefono, direccion, idProvincia, idDepartamento) VALUES ('{0}', '{1}', '{2}', '{3}', '{4}', {5}, '{6}', {7}, {8})"
                cursor.execute(sql.format(usuario[0], usuario[1], usuario[2], usuario[3], usuario[4], usuario[5], usuario[6], usuario[7], usuario[8]))
                self.connexion.commit()
                print("Usuario registrado! \n")
            except Error as ex:
                print("Error al intentar la conexion: {0}".format(ex))

    def actualizarUsuario(self, usuario):
        if self.connexion.is_connected():
            try:
                cursor = self.connexion.cursor()
                sql= "UPDATE usuario SET username = '{0}', contraseña = '{1}', email = '{2}', nombre = '{3}', apellido = '{4}', telefono = {5}, direccion = '{6}', idProvincia = {7}, idDepartamento= {8} WHERE id = {9}"
                cursor.execute(sql.format(usuario[1], usuario[2], usuario[3], usuario[4], usuario[5], usuario[6], usuario[7], usuario[8],usuario[9], usuario[0]))
                self.connexion.commit()
                print("Usuario actualizado! \n")
            except Error as ex:
                print("Error al intentar la conexion: {0}".format(ex))

    def eliminarUsuario(self, usuarioParaEliminar):
        if self.connexion.is_connected():
            try:
                cursor = self.connexion.cursor()
                sql= "DELETE FROM usuario WHERE id  = {0}"
                cursor.execute(sql.format(usuarioParaEliminar))
                self.connexion.commit()
                print("Usuario eliminado! \n")
            except Error as ex:
                print("Error al intentar la conexion: {0}".format(ex))

    def registrarMovimientoBD(self, movimiento, usuario = None):
        if self.connexion.is_connected():
            try:
                cursor = self.connexion.cursor()
                if movimiento == 2:
                    sql= "INSERT INTO movimientosBD (idEstadoRegistro) VALUES ({0})"
                    cursor.execute(sql.format(movimiento))
                else:    
                    if movimiento == 1:
                        sql = "SELECT * FROM usuario WHERE username = '{0}'"   
                        cursor.execute(sql.format(usuario[0]))
                        usuario = cursor.fetchone()
                    sql= "INSERT INTO movimientosBD (idEstadoRegistro, idUsuario, username, contraseña, email, nombre, apellido, telefono, direccion, idProvincia, idDepartamento) VALUES ({0}, {1}, '{2}', '{3}', '{4}', '{5}', '{6}', {7}, '{8}', {9}, {10})"
                    cursor.execute(sql.format(movimiento, usuario[0], usuario[1], usuario[2], usuario[3], usuario[4], usuario[5], usuario[6], usuario[7], usuario[8], usuario[9]))
                self.connexion.commit()
            except Error as ex:
                print("Error al intentar la conexion: {0}".format(ex))

    def obtenerMovimientos(self):
        if self.connexion.is_connected():
            try:
                cursor = self.connexion.cursor()
                cursor.execute("SELECT * FROM movimientosBD ORDER BY id ASC")
                resultados = cursor.fetchall()
                return resultados
            except Error as ex:
                print("Error al intentar la conexion: {0}".format(ex))            

