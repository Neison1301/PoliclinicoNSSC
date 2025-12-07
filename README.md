# 🏥 Sistema de Gestión Policlínico NSSC

> *Software integral para la gestión de servicios médicos y administrativos*

Un sistema completo desarrollado con Spring Boot y tecnologías Java para gestionar pacientes, citas médicas, historiales clínicos, personal médico y generar reportes administrativos con un dashboard intuitivo para centros de salud.

![Java](https://img.shields.io/badge/Java-21-ED8B00?style=for-the-badge&logo=java&logoColor=white)
![Spring Boot](https://img.shields.io/badge/Spring_Boot-3.5.3-6DB33F?style=for-the-badge&logo=spring&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-8.0-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-Enabled-2496ED?style=for-the-badge&logo=docker&logoColor=white)

---

## 📋 Tabla de Contenidos

- [Características](#-características)
- [Arquitectura Docker](#-arquitectura-docker)
- [Requisitos Previos](#-requisitos-previos)
- [Instalación con Docker](#-instalación-con-docker-recomendado)
- [Instalación Manual](#-instalación-manual-sin-docker)
- [Uso de la Aplicación](#-uso-de-la-aplicación)
- [Variables de Entorno](#-variables-de-entorno)
- [Scripts Disponibles](#-scripts-disponibles)
- [Troubleshooting](#-troubleshooting)
- [Colaboración](#-colaboración)

---

## ✨ Características

- 👥 **Gestión de Pacientes**: Registro, actualización y consulta de información de pacientes
- 📅 **Sistema de Citas**: Programación y seguimiento de citas médicas
- 📋 **Historiales Clínicos**: Registro completo de consultas y tratamientos
- 👨‍⚕️ **Gestión de Personal**: Administración de médicos y personal de salud
- 📊 **Dashboard Administrativo**: Reportes y estadísticas en tiempo real
- 🔐 **Sistema de Autenticación**: Control de acceso basado en roles
- 📧 **Notificaciones por Email**: Confirmaciones y recordatorios automáticos

---

## 🐳 Arquitectura Docker

El sistema está completamente contenerizado con Docker, garantizando portabilidad y facilidad de despliegue:

```
┌─────────────────────────────────────────────────┐
│           Docker Compose Orchestration          │
├─────────────────────────────────────────────────┤
│                                                 │
│  ┌──────────────────┐    ┌──────────────────┐  │
│  │   Spring Boot    │    │   MySQL 8.0      │  │
│  │   Application    │◄───┤   Database       │  │
│  │   Port: 8080     │    │   Port: 3307     │  │
│  └──────────────────┘    └──────────────────┘  │
│           │                       │             │
│           └───────────┬───────────┘             │
│                policlinico-network              │
│                                                 │
│  Volúmenes Persistentes:                        │
│  └─ mysql-data (Base de datos)                  │
└─────────────────────────────────────────────────┘
```

**Servicios:**
- **app**: Aplicación Spring Boot (Java 21)
- **mysql-db**: Base de datos MySQL 8.0

**Características Docker:**
- ✅ Multi-stage build para optimización de imagen
- ✅ Health checks automáticos
- ✅ Persistencia de datos con volúmenes
- ✅ Red interna aislada
- ✅ Variables de entorno configurables
- ✅ Usuario no-root para seguridad

---

## 📋 Requisitos Previos

### Para Despliegue con Docker (Recomendado)
- **Docker Desktop** 20.10+ ([Descargar](https://www.docker.com/products/docker-desktop))
- **Docker Compose** 2.0+ (incluido en Docker Desktop)
- **Git** para clonar el repositorio

### Para Desarrollo Local (Sin Docker)
- **Java JDK 21** o superior
- **Maven 3.6+**
- **MySQL 8.0+**
- **Git**

```bash
# Verificar versiones instaladas
docker --version
docker-compose --version
git --version
```

---

## 🚀 Instalación con Docker (RECOMENDADO)

### Paso 1: Clonar el Repositorio

```bash
git clone https://github.com/Neison1301/PoliclinicoNSSC.git
cd PoliclinicoNSSC
```

### Paso 2: Configurar Variables de Entorno

```bash
# Copiar el archivo de ejemplo
copy .env.example .env

# Editar el archivo .env con tus credenciales
notepad .env
```

**Configuración mínima requerida en `.env`:**
```env
MYSQL_ROOT_PASSWORD=tu_password_seguro
MYSQL_DATABASE=policlinicosagrado
MYSQL_USER=policlinico_user
MYSQL_PASSWORD=tu_password_db

MAIL_USERNAME=tu_email@gmail.com
MAIL_PASSWORD=tu_password_app
```

### Paso 3: Construir e Iniciar

#### Opción A: Usando Scripts (Windows)

```bash
# 1. Construir las imágenes
build.bat

# 2. Iniciar la aplicación
start.bat
```

#### Opción B: Usando Docker Compose Directamente

```bash
# 1. Compilar la aplicación
mvnw.cmd clean package -DskipTests

# 2. Construir las imágenes
docker-compose build

# 3. Iniciar los contenedores
docker-compose up -d

# 4. Ver logs en tiempo real
docker-compose logs -f
```

### Paso 4: Verificar el Despliegue

```bash
# Ver estado de los contenedores
docker-compose ps

# Verificar logs
docker-compose logs app
docker-compose logs mysql-db

# Verificar health checks
docker inspect policlinico-app --format='{{.State.Health.Status}}'
```

### Paso 5: Acceder a la Aplicación

- **URL Principal**: http://localhost:8080/policlinico
- **Health Check**: http://localhost:8080/policlinico/actuator/health
- **MySQL**: `localhost:3307` (usuario: policlinico_user)

**Credenciales de Acceso:**
- Usuario: `admin`
- Contraseña: `admin123`

---

## 🛠️ Instalación Manual (Sin Docker)

<details>
<summary>Click para expandir instrucciones de instalación manual</summary>

### Paso 1: Configurar MySQL

```sql
-- Crear base de datos
CREATE DATABASE policlinicosagrado;

-- Crear usuario
CREATE USER 'policlinico_user'@'localhost' IDENTIFIED BY 'policlinico_pass';
GRANT ALL PRIVILEGES ON policlinicosagrado.* TO 'policlinico_user'@'localhost';
FLUSH PRIVILEGES;
```

### Paso 2: Configurar application.properties

```properties
# src/main/resources/application.properties
spring.datasource.url=jdbc:mysql://localhost:3306/policlinicosagrado
spring.datasource.username=policlinico_user
spring.datasource.password=policlinico_pass
```

### Paso 3: Compilar y Ejecutar

```bash
# Compilar
mvnw.cmd clean package

# Ejecutar
java -jar target/PoliclinicoSagradoCorazon-0.0.1-SNAPSHOT.jar
```

</details>

---

## 📱 Uso de la Aplicación

### Endpoints Principales

| Endpoint | Descripción | Método |
|----------|-------------|--------|
| `/policlinico` | Página principal | GET |
| `/policlinico/login` | Inicio de sesión | GET/POST |
| `/policlinico/dashboard` | Panel administrativo | GET |
| `/policlinico/pacientes` | Gestión de pacientes | GET/POST |
| `/policlinico/citas` | Gestión de citas | GET/POST |
| `/policlinico/actuator/health` | Estado de salud | GET |

### Roles y Permisos

- **ADMIN**: Acceso completo al sistema
- **DOCTOR**: Gestión de pacientes y citas
- **RECEPCIONISTA**: Registro de pacientes y citas

---

## 🔐 Variables de Entorno

### Variables de Base de Datos

| Variable | Descripción | Valor por Defecto |
|----------|-------------|-------------------|
| `MYSQL_ROOT_PASSWORD` | Contraseña root de MySQL | `rootpassword` |
| `MYSQL_DATABASE` | Nombre de la base de datos | `policlinicosagrado` |
| `MYSQL_USER` | Usuario de la aplicación | `policlinico_user` |
| `MYSQL_PASSWORD` | Contraseña del usuario | `policlinico_pass` |

### Variables de Email

| Variable | Descripción | Valor por Defecto |
|----------|-------------|-------------------|
| `MAIL_HOST` | Servidor SMTP | `smtp.gmail.com` |
| `MAIL_PORT` | Puerto SMTP | `587` |
| `MAIL_USERNAME` | Email del remitente | - |
| `MAIL_PASSWORD` | Contraseña de aplicación | - |

### Variables de Spring

| Variable | Descripción | Valor por Defecto |
|----------|-------------|-------------------|
| `SPRING_PROFILES_ACTIVE` | Perfil activo | `prod` |

---

## 📜 Scripts Disponibles

### Windows (`.bat`)

| Script | Comando | Descripción |
|--------|---------|-------------|
| **Build** | `build.bat` | Compila y construye las imágenes Docker |
| **Start** | `start.bat` | Inicia los contenedores |
| **Stop** | `stop.bat` | Detiene los contenedores |
| **Cleanup** | `cleanup.bat` | Elimina contenedores, imágenes y volúmenes |

### Comandos Docker Compose

```bash
# Iniciar en modo detached
docker-compose up -d

# Ver logs en tiempo real
docker-compose logs -f

# Ver logs de un servicio específico
docker-compose logs -f app

# Detener servicios
docker-compose stop

# Detener y eliminar contenedores
docker-compose down

# Detener y eliminar contenedores + volúmenes
docker-compose down -v

# Reconstruir imágenes
docker-compose build --no-cache

# Ver estado de servicios
docker-compose ps

# Ejecutar comando en contenedor
docker-compose exec app bash
```

---

## 🔧 Troubleshooting

### Problema: Puerto 8080 ya está en uso

```bash
# Windows: Encontrar proceso usando el puerto
netstat -ano | findstr :8080

# Matar el proceso (reemplaza PID)
taskkill /PID <PID> /F

# O cambiar el puerto en docker-compose.yml
ports:
  - "8081:8080"  # Usar puerto 8081 externamente
```

### Problema: Puerto 3307 ya está en uso

```bash
# Cambiar el puerto de MySQL en docker-compose.yml
ports:
  - "3308:3306"  # Usar puerto 3308 externamente
```

### Problema: Error de conexión a MySQL

```bash
# Verificar que MySQL esté saludable
docker-compose ps

# Ver logs de MySQL
docker-compose logs mysql-db

# Reiniciar solo MySQL
docker-compose restart mysql-db

# Esperar a que MySQL esté listo
docker-compose up -d mysql-db
timeout /t 30
docker-compose up -d app
```

### Problema: Aplicación no inicia

```bash
# Ver logs detallados
docker-compose logs -f app

# Verificar variables de entorno
docker-compose config

# Reconstruir desde cero
docker-compose down -v
docker-compose build --no-cache
docker-compose up -d
```

### Problema: Datos perdidos después de reiniciar

```bash
# Verificar que el volumen existe
docker volume ls | findstr policlinico

# Inspeccionar el volumen
docker volume inspect policlinico-mysql-data

# NO uses 'docker-compose down -v' si quieres mantener los datos
# Usa solo 'docker-compose down'
```

### Problema: Error de compilación Maven

```bash
# Limpiar caché de Maven
mvnw.cmd clean

# Compilar sin tests
mvnw.cmd clean package -DskipTests

# Verificar Java version
java -version  # Debe ser 21+
```

---

## 🤝 Colaboración

### Flujo de Trabajo con Git

```bash
# 1. Actualizar código local
git checkout master
git pull origin master

# 2. Crear rama para nueva funcionalidad
git checkout -b feature/mi-funcionalidad

# 3. Realizar cambios y commit
git add .
git commit -m "feat: Descripción de cambios"

# 4. Subir cambios
git push origin feature/mi-funcionalidad

# 5. Crear Pull Request en GitHub
```

### Convenciones de Commits

- `feat:` Nueva funcionalidad
- `fix:` Corrección de errores
- `docs:` Cambios en documentación
- `style:` Formato de código
- `refactor:` Refactorización
- `test:` Agregar tests
- `chore:` Tareas de mantenimiento

---

## 📞 Soporte y Contacto

- **Repositorio**: https://github.com/Neison1301/PoliclinicoNSSC.git
- **Issues**: [Reportar problemas](https://github.com/Neison1301/PoliclinicoNSSC/issues)
- **Documentación**: Consultar la wiki del proyecto

---

## 📄 Licencia

Este proyecto es desarrollado con fines académicos para la Universidad Tecnológica del Perú.

---

## 🎯 Comandos Rápidos

```bash
# Inicio rápido
git clone https://github.com/Neison1301/PoliclinicoNSSC.git
cd PoliclinicoNSSC
copy .env.example .env
# Editar .env con tus credenciales
build.bat
start.bat

# Detener
stop.bat

# Limpiar todo
cleanup.bat

# Ver logs
docker-compose logs -f

# Reiniciar servicios
docker-compose restart
```

---

🏥 **Sistema desarrollado para mejorar la gestión de centros de salud con tecnología Java y Docker**
