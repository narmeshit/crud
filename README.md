# CRUD

Es un acrónimo que representa las cuatro operaciones básicas que se pueden realizar en una base de datos o sistema de almacenamiento de información. Estas operaciones son:

- **Create (Crear):** La operación de crear consiste en insertar un nuevo registro en la base de datos. Este es el primer paso cuando se desea almacenar nueva información.
- **Read (Leer):** La operación de leer implica recuperar uno o más registros de la base de datos. Esto se utiliza para mostrar datos al usuario o para consultar información específica.
- **Update (Actualizar):** La operación de actualizar se utiliza para modificar la información de un registro existente en la base de datos. Se suele utilizar cuando un usuario edita su perfil o actualiza alguna otra información.
- **Delete (Eliminar):**La operación de eliminar consiste en borrar uno o más registros de la base de datos. Esto se utiliza cuando se quiere eliminar permanentemente un registro.

## Ejemplo en SQL

Create

```sql
INSERT INTO nombre_tabla (columna1, columna2) VALUES ("valor_columna1", "valor_columna2");
```

```sql
INSERT INTO users (username, password) VALUES ('admin', 'admin');
```

Read

```sql
SELECT * FROM nombre_tabla WHERE columna1 = 'valor_columna1';
```

```sql
SELECT * FROM users WHERE username = 'admin';
```

Update

```sql
UPDATE nombre_tabla SET columna2 = 'valor_columna2' WHERE columna1 = 'valor_columna1';
```

```sql
UPDATE users SET username = 'administrador' WHERE id = 1;
```

Delete

```sql
DELETE FROM nombre_tabla WHERE columna1 = 'valor_columna1';
```

```sql
DELETE FROM users WHERE id = 1;
```

CRUD es fundamental en el desarrollo de aplicaciones, ya que cubre las operaciones más comunes que las aplicaciones realizan con datos. Se puede aplicar tanto a bases de datos relacionales (como MySQL, PostgreSQL) como a bases de datos NoSQL o cualquier tipo de sistema de almacenamiento de datos.

## CRUD en una API RESTful

En una API RESTful, las operaciones CRUD se suelen mapear a métodos HTTP, que son utilizados por los clientes para interactuar con el servidor.

- **Create (POST):** Un cliente envía una solicitud POST para crear un nuevo recurso. El servidor procesa esta solicitud y almacena el recurso.
- **Read (GET):** El cliente envía una solicitud GET para recuperar información. Puede ser una solicitud de un recurso específico o de una colección de recursos.
- **Update (PUT/PATCH):** El cliente envía una solicitud PUT (para actualizar completamente) o PATCH (para actualizaciones parciales) para modificar un recurso existente.
- **Delete (DELETE):** El cliente envía una solicitud DELETE para eliminar un recurso.

## Consideraciones

- **Seguridad:** Las operaciones CRUD deben estar protegidas mediante autenticación y autorización para asegurarse de que solo los usuarios autorizados puedan realizar cambios en los datos.
- **Validación de Datos:** Antes de realizar cualquier operación, se deben validar los datos para evitar inconsistencias en la base de datos.
- **Transacciones:** En sistemas complejos, las operaciones CRUD pueden involucrar múltiples pasos que necesitan ser atómicos. Es decir, o se completan todas las operaciones o no se realiza ninguna. Esto se maneja con transacciones en bases de datos.