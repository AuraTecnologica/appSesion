# appSesion
Ejemplo Aplicación distribuida para Wildfly en Modo Dominio.

Esta aplicación permite probar tanto las variables de sesión como la cache de segundo nivel de hibernate. Para ello, utilizaremos maven para generar un paquete war para subir al servidor de aplicaciones.

## Generar el archivo .war

En primer lugar, descargar el repositorio con GIT.

```bash
git clone https://github.com/AuraTecnologica/appSesion.git
```

Una vez descargado, nos iremos a la carpeta src y configuraremos la conexión con la base de datos en el fichero _hibernate.cfg.xml_.

### Configuración de la base de datos

Para que funcione correctamente la base de datos necesitaremos crear una tabla y añadir contenido Seguidamente se muestra el código SQL necesario para ello.

```sql
CREATE TABLE Usuario( id BIGINT(20) AUTO_INCREMENT PRIMARY KEY, Login VARCHAR(20), password TEXT); -- Crear tabla Usuario
INSERT INTO USUARIO(Login,password)values('prueba','1234'); -- insertar datos.
```

Una vez configurada la base de datos, vamos a generar el archivo war usando maven.

```bash
mvn package
```

Si todo va correctamente, se generará un archivo .war en la carpeta /target. Tras esto, desplegar dicho war en el servidor de aplicaciones.

## Uso de la aplicación

El uso de la aplicación es muy sencillo para ello, simplemente entramos a la aplicación en la siguiente dirección:

http://localhost:8080/appSession-0.0.1-SNAPSHOT

Se mostrará un formulario de Login en el cual introduciremos la informacion que hemos introducido en la base de datos.

Tras esto, se mostrará una pantalla donde podremos introducir datos en sesión. Además de ver los datos de ID de sesión del servidor y del cliente.
