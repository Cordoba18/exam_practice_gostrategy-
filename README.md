Proyecto: Prueba Entrevista Full Stack PHP
1. Descripción del Servicio
Este proyecto es Aplicación web que proporciona la capacidad crear y eliminar customers de forma segura y confiable. Está diseñado para evaluará mis conocimientos, capacidad de responsabilidad y cumplimiento de tareas.
2. Métodos y Funcionalidades
2.1. Endpoints o Métodos Disponibles
A continuación, se enumeran los métodos o endpoints disponibles en este servicio, junto con una breve descripción de cada uno:
•	GET /api/get_users: Obtiene una lista usuarios. 
•	GET /api/customers/get_regiones:Obtiene una lista de regiones.
•	GET /api/customers/get_communes:Obtiene una lista de comunas.
•	GET /api/customers/get_customers:Obtiene una lista de clientes.
•	POST  /api/ customers /save:Guarda un customer en base de datos.
•	POST  /api/ customers /delete: Elimina un recurso específico por su ID. 
Para cada método, se detallan los parámetros necesarios, los posibles códigos de respuesta y ejemplos de solicitudes y respuestas.

El token de autenticación para pruebas desde gestores de APIs como postman podrán verlo al iniciar sesión, se imprimirá siempre en la consola del navegador mientras estes dentro de la navegación del grupo ‘home’ (es decir logueado).
2.2. Descripción de Métodos
GET /api/get_users
•	Descripción: Recupera todos los recursos disponibles.
•	Parámetros:
o	token: Token de autenticacion
•	Respuesta Exitosa:
o	Código 200: Lista de recursos en formato JSON.
o	Data: Lista de usuarios
o	Status : true
GET /api/customers/get_regiones
•	Descripción: Recupera regiones especificas
•	Parámetros:
o	token: Token de autenticacion
•	Respuesta Exitosa:
o	Data: Lista de regiones con (status) = activo
o	Status : true
o	Message : success
•	Respuesta Error:
o	Data: null
o	Status : true,
o	Message: detalle del error

GET /api/customers/get_communes
•	Descripción: Recupera comunas especificas
•	Parámetros:
o	token: Token de autenticacion
o	    'id_reg' => 'required',
•	Respuesta Exitosa:
o	Data: Lista de comunas con (status) = activo y coincide con (id_reg) de alguna region
o	Status : true
o	Message : success
•	Respuesta Error:
o	Data: null
o	Status : true,
o	Message: detalle del error
GET /api/customers/get_customers
•	Descripción: Recupera customers en específico.
•	Parámetros:
o	token: Token de autenticación
o	dni
o	email
•	Respuesta Exitosa:
o	Data: Lista de customers con (status) = activo y coincide con (dni) o (email) coincida con algún customer
o	Status : true
o	Message : success
•	Respuesta Error:
o	Data: null
o	Status : true,
o	Message: detalle del error
POST /api/customers/save
•	Descripción: Guarda un customer
•	Parámetros:
o	token: Token de autenticación
o	dni' => 'required|integer|min:11',
o	        'id_com' => 'required|integer',
o	        'email' => 'required|email|max:120',
o	        'name' => 'required|max:45',
o	        'lastname' => 'required:max:45',
o	        'address' => 'max:255',
o	        'date_reg' => 'required|date',
o	        'status' => 'required|integer|max:1', 
•	        'Respuesta Exitosa:
o	Data: customer 
o	Status : true
o	Message : success
•	Respuesta Error:
o	Data: null
o	Status : true,
o	Message: detalle del error
POST /api/customers/delete
•	Descripción: Elimina un customer con un id especifico.
•	Parámetros:
o	token: Token de autenticación
o	'dni' => 'required|integer|min:11',      
  'Respuesta Exitosa:
o	Data: customer 
o	Status : true
o	Message : success
•	Respuesta Error:
o	Data: null
o	Status : true,
o	Message: detalle del error

2.3 Descripción de Middlewares
ValidateApiKey
Este middleware es el que se encarga de validar el token de autencicacion en todas las interacciones del aplicativo
Caracteristicas:
1.	Verificar si el token enviado existe en base de datos
2.	Verificar si el token esta expirado o no
3.	Verificar hay un token

En el Frontend si el toquen cumple alguna de las restricciones le cerrara la sesión y lo devolverá al apartado “Log in”.
LogRequests 
Este middleware es el que se encarga de crear los log de entrada y de salida del usuario al interactuar con alguna ruta. 
3. Instalación
3.1. Requisitos Previos
Antes de instalar este proyecto, asegúrate de tener instalados los siguientes componentes:
•	PHP versión 8.0 o superior
•	Composer para la gestión de dependencias de PHP
•	Axios para las peticiones via API REST
•	Npm para el uso de librerías Nodemodules
•	Servidor Web como Apache o Nginx
•	Base de Datos como MySQL o PostgreSQL
3.2. Pasos de Instalación
Sigue estos pasos para instalar y configurar el proyecto:
1.	Clonar el repositorio:
bash
Copiar código
git clone https://github.com/Cordoba18/exam_practice_gostrategy-.git
cd exam_practice_gostrategy-/exam_practice_gostrategy
2.	Instalar dependencias:
npm install
composer install
3.	Configurar el archivo .env:
o	Copia el archivo .env.example a .env 
4.	Generar clave de aplicación:
php artisan key:generate
5.	Importar la base de datos:
Crear base de datos sql con el siguiente nombre exam_practice_gostrategy_bd  y con utf8mb4_general_ci
Importar sql del repositorio exam_practice_gostrategy_bd.sql 

6.	Iniciar el servidor de desarrollo:
php artisan serve
4. Configuración
4.1. Variables de Entorno
•	Como el proyecto es un proyecto básico y local para su validación deje las creadenciales en el .env-example para que no sea necesario configurarlas.
5. Requerimientos Mínimos
Para ejecutar este proyecto, asegúrate de tener los siguientes requisitos mínimos:
•	Sistema Operativo: Linux, macOS o Windows
•	Memoria: 2GB RAM o superior
•	Espacio en Disco: 100MB para instalación básica
•	PHP: Versión 8.0 o superior
•	Extensiones de PHP:
o	pdo
o	mbstring
o	openssl
o	tokenizer
o	xml
8. Contacto
Para más información o preguntas, contacta a jccq12@gmail.com o +57 3043711546.
________________________________________

