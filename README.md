# 🏥 Sistema de Gestión Policlínico NSSC

> *Software integral para la gestión de servicios médicos y administrativos*

Un sistema completo desarrollado con Spring Boot y tecnologías Java para gestionar pacientes, citas médicas, historiales clínicos, personal médico y generar reportes administrativos con un dashboard intuitivo para centros de salud.

![Java](https://img.shields.io/badge/Java-11+-ED8B00?style=for-the-badge&logo=java&logoColor=white)
![Spring Boot](https://img.shields.io/badge/Spring_Boot-2.7+-6DB33F?style=for-the-badge&logo=spring&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-8.0+-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Thymeleaf](https://img.shields.io/badge/Thymeleaf-3.0+-005F0F?style=for-the-badge&logo=thymeleaf&logoColor=white)
![Bootstrap](https://img.shields.io/badge/Bootstrap-5.0+-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white)


## 📋 Requisitos Previos del Sistema

Antes de comenzar, asegúrate de tener instalado en tu equipo:

- *Java JDK 17 o superior*
- *Maven 3.6+* para gestión de dependencias
- *MySQL 8.0+* como servidor de base de datos
- *Git* para control de versiones
- *IDE* (IntelliJ IDEA, Eclipse, o VS Code con extensión Java)

bash
# Verificar versiones instaladas
java -version
mvn -version
mysql --version
git --version


## 🚀 Guía de Instalación Completa

### Paso 1: Preparación del Entorno

#### 1.1 Verificar Java JDK
bash
# Verificar versión de Java
java -version

# Verificar variable JAVA_HOME
echo $JAVA_HOME


#### 1.2 Configurar MySQL
sql
-- Crear base de datos
CREATE DATABASE policlinico_nssc;

-- Crear usuario específico (opcional)
CREATE USER 'policlinico_user'@'localhost' IDENTIFIED BY 'policlinico_password';
GRANT ALL PRIVILEGES ON policlinico_nssc.* TO 'policlinico_user'@'localhost';
FLUSH PRIVILEGES;


### Paso 2: Clonación del Repositorio

#### 2.1 Clonar el Proyecto
bash
git clone https://github.com/Neison1301/PoliclinicoNSSC.git


#### 2.2 Acceder al Directorio del Proyecto
bash
cd PoliclinicoNSSC


### Paso 3: Configuración del Entorno Local

#### 3.1 Configurar Git (Solo primera vez)
bash
# Configurar nombre de usuario
git config --global user.name "Tu Nombre"

# Configurar email
git config --global user.email "tu.email@ejemplo.com"


#### 3.2 Verificar Configuración de Ramas
bash
# Ver rama actual
git branch

# Ver todas las ramas
git branch -a

# Cambiar a rama principal (si no está activa)
git checkout master


### Paso 4: Configuración de la Base de Datos

#### 4.1 Configurar application.properties
properties
# src/main/resources/application.properties

# Configuración de la base de datos MySQL
spring.datasource.url=jdbc:mysql://localhost:3306/policlinico_nssc?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true
spring.datasource.username=root
spring.datasource.password=tu_password_mysql
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver

# Configuración JPA/Hibernate
spring.jpa.hibernate.ddl-auto=update
spring.jpa.database-platform=org.hibernate.dialect.MySQL8Dialect
spring.jpa.show-sql=true
spring.jpa.format-sql=true

# Configuración del servidor
server.port=8080
server.servlet.context-path=/policlinico

# Configuración Thymeleaf
spring.thymeleaf.cache=false
spring.thymeleaf.enabled=true
spring.thymeleaf.prefix=classpath:/templates/
spring.thymeleaf.suffix=.html


#### 4.2 Configurar application-dev.properties (Entorno de Desarrollo)
properties
# src/main/resources/application-dev.properties

# Configuración específica para desarrollo
logging.level.org.springframework.web=DEBUG
logging.level.org.hibernate.SQL=DEBUG
spring.jpa.properties.hibernate.format_sql=true


### Paso 5: Instalación de Dependencias

bash
# Limpiar e instalar dependencias
mvn clean install


### Paso 6: Ejecución del Sistema

#### 6.1 Compilar el Proyecto
bash
# Compilar sin ejecutar tests
mvn clean compile

# Compilar con tests
mvn clean test


#### 6.2 Iniciar la Aplicación
bash
# Opción 1: Usar Maven
mvn spring-boot:run

# Opción 2: Usar Java directamente
java -jar target/policlinico-nssc-1.0.0.jar

# Opción 3: Desde IDE (IntelliJ/Eclipse)
# Ejecutar la clase principal con @SpringBootApplication


#### 6.3 Verificar que el Sistema Está Funcionando
- Abrir navegador web
- Navegar a: http://localhost:8080/policlinico
- Verificar que la página de login aparezca correctamente

### Paso 7: Credenciales de Acceso



👩‍💼 Usuario Administrador:
- Usuario: admin
- Contraseña: admin123



## 🔧 Configuración para Colaboradores

### Creación de Ramas de Trabajo

#### Para Nuevas Funcionalidades
bash
# Crear rama para nueva funcionalidad
git checkout -b feature/nueva-funcionalidad

# Ejemplo: Agregar módulo de farmacia
git checkout -b feature/modulo-farmacia


#### Para Corrección de Errores
bash
# Crear rama para corrección
git checkout -b bugfix/descripcion-error

# Ejemplo: Corregir error en citas
git checkout -b bugfix/error-citas-duplicadas


#### Para Mejoras
bash
# Crear rama para mejoras
git checkout -b improvement/descripcion-mejora

# Ejemplo: Mejorar interfaz de usuario
git checkout -b improvement/ui-dashboard


### Flujo de Trabajo Colaborativo

#### 1. Actualizar Código Local
bash
# Cambiar a rama master
git checkout master

# Obtener últimos cambios
git pull origin master


#### 2. Trabajar en Nueva Funcionalidad
bash
# Crear y cambiar a nueva rama
git checkout -b feature/mi-funcionalidad

# Realizar cambios en el código
# ... hacer modificaciones ...

# Agregar cambios
git add .

# Confirmar cambios
git commit -m "feat: Descripción clara de los cambios realizados"


#### 3. Enviar Cambios al Repositorio
bash
# Subir rama al repositorio remoto
git push origin feature/mi-funcionalidad

``

## 📞 Soporte y Contacto

- *Repositorio*: https://github.com/Neison1301/PoliclinicoNSSC.git
- *Issues*: Reportar problemas en GitHub Issues
- *Documentación*: Consultar la wiki del proyecto

🏥 *Sistema desarrollado para mejorar la gestión de centros de salud con tecnología Java*
