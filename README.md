# CRUD con APIs REST (Representational State Transfer)

Es una forma de comunicación entre sistemas que sigue principios específicos para intercambiar datos a través de la web. Imagina que las APIs REST son como mensajeros que entregan y traen información entre diferentes aplicaciones, usando HTTP, el mismo protocolo que usamos para navegar por internet.

## ¿Cómo funciona?

- **Recursos:** Todo se trata de recursos, que pueden ser cosas como usuarios, productos, pedidos, etc. Cada recurso tiene una dirección única (URL) que lo identifica, como una dirección postal para una casa.
- **Operaciones básicas (CRUD):** Con una API REST, puedes realizar cuatro operaciones principales en estos recursos, que son:

### Crear (POST): Añadir un nuevo recurso

### Leer (GET): Obtener información de un recurso

### Actualizar (PUT o PATCH): Modificar un recurso existente

### Eliminar (DELETE): Borrar un recurso

- **Stateless:** Una característica importante de REST es que es "sin estado" (stateless). Esto significa que cada solicitud que haces es independiente de las anteriores. El servidor no recuerda las solicitudes anteriores, lo que hace que cada mensaje sea completo en sí mismo.
- **Formato de datos:** El intercambio de datos generalmente se hace en formatos ligeros como JSON o XML. JSON es el más común porque es más fácil de leer tanto para las personas como para las máquinas.