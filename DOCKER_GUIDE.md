# 🐳 GUÍA RÁPIDA DE DOCKER - Policlínico NSSC

## ⚡ Inicio Rápido (5 minutos)

```bash
# 1. Clonar y entrar al proyecto
git clone https://github.com/Neison1301/PoliclinicoNSSC.git
cd PoliclinicoNSSC

# 2. Configurar variables de entorno
copy .env.example .env
# Editar .env con tus credenciales

# 3. Construir e iniciar
build.bat
start.bat

# 4. Acceder
# http://localhost:8080/policlinico
```

---

## 📦 Archivos Docker del Proyecto

```
policlinicoSC/
├── docker-compose.yml          # Orquestación de servicios
├── Dockerfile                  # Imagen de la aplicación
├── .env.example               # Template de variables
├── .dockerignore              # Archivos excluidos del build
├── application-docker.properties  # Config para Docker
├── build.bat                  # Script de construcción
├── start.bat                  # Script de inicio
├── stop.bat                   # Script de detención
└── cleanup.bat                # Script de limpieza
```

---

## 🔧 Comandos Esenciales

### Construcción
```bash
# Compilar aplicación
mvnw.cmd clean package -DskipTests

# Construir imágenes
docker-compose build

# Construir sin caché
docker-compose build --no-cache
```

### Ejecución
```bash
# Iniciar servicios (detached)
docker-compose up -d

# Iniciar con logs visibles
docker-compose up

# Ver logs en tiempo real
docker-compose logs -f

# Ver logs de un servicio
docker-compose logs -f app
```

### Gestión
```bash
# Ver estado de servicios
docker-compose ps

# Detener servicios
docker-compose stop

# Detener y eliminar contenedores
docker-compose down

# Detener y eliminar TODO (incluyendo datos)
docker-compose down -v

# Reiniciar servicios
docker-compose restart

# Reiniciar un servicio específico
docker-compose restart app
```

### Inspección
```bash
# Entrar a un contenedor
docker-compose exec app bash
docker-compose exec mysql-db bash

# Ver logs de MySQL
docker-compose logs mysql-db

# Verificar health check
docker inspect policlinico-app --format='{{.State.Health.Status}}'

# Ver configuración procesada
docker-compose config

# Ver recursos usados
docker stats
```

### Volúmenes
```bash
# Listar volúmenes
docker volume ls

# Inspeccionar volumen de MySQL
docker volume inspect policlinico-mysql-data

# Backup de base de datos
docker-compose exec mysql-db mysqldump -u root -p policlinicosagrado > backup.sql

# Restaurar base de datos
docker-compose exec -T mysql-db mysql -u root -p policlinicosagrado < backup.sql
```

---

## 🌐 Endpoints y Puertos

| Servicio | Puerto Interno | Puerto Externo | URL |
|----------|----------------|----------------|-----|
| **Spring Boot** | 8080 | 8080 | http://localhost:8080/policlinico |
| **MySQL** | 3306 | 3307 | localhost:3307 |
| **Health Check** | 8080 | 8080 | http://localhost:8080/policlinico/actuator/health |

---

## 🔐 Variables de Entorno

### Archivo .env
```env
# Base de Datos
MYSQL_ROOT_PASSWORD=rootpassword
MYSQL_DATABASE=policlinicosagrado
MYSQL_USER=policlinico_user
MYSQL_PASSWORD=policlinico_pass

# Email
MAIL_HOST=smtp.gmail.com
MAIL_PORT=587
MAIL_USERNAME=tu_email@gmail.com
MAIL_PASSWORD=tu_password_app

# Spring
SPRING_PROFILES_ACTIVE=prod
```

---

## 🐛 Troubleshooting Rápido

### Puerto en uso
```bash
# Encontrar proceso
netstat -ano | findstr :8080

# Matar proceso
taskkill /PID <PID> /F
```

### MySQL no inicia
```bash
# Ver logs
docker-compose logs mysql-db

# Reiniciar solo MySQL
docker-compose restart mysql-db

# Eliminar volumen y reiniciar
docker-compose down -v
docker-compose up -d
```

### App no se conecta a MySQL
```bash
# Verificar que MySQL esté healthy
docker-compose ps

# Esperar más tiempo
docker-compose up -d mysql-db
timeout /t 30
docker-compose up -d app

# Ver logs de conexión
docker-compose logs app | findstr "MySQL"
```

### Limpiar todo y empezar de nuevo
```bash
cleanup.bat
build.bat
start.bat
```

---

## 📊 Monitoreo

### Ver recursos en tiempo real
```bash
docker stats
```

### Ver procesos en contenedor
```bash
docker-compose exec app ps aux
```

### Ver variables de entorno
```bash
docker-compose exec app env
```

---

## 🔄 Actualización del Código

```bash
# 1. Detener servicios
docker-compose down

# 2. Actualizar código
git pull origin master

# 3. Reconstruir
mvnw.cmd clean package -DskipTests
docker-compose build

# 4. Reiniciar
docker-compose up -d
```

---

## 💾 Backup y Restauración

### Backup completo
```bash
# Backup de base de datos
docker-compose exec mysql-db mysqldump -u root -p policlinicosagrado > backup_$(date +%Y%m%d).sql

# Backup de volumen
docker run --rm -v policlinico-mysql-data:/data -v %cd%:/backup ubuntu tar czf /backup/mysql-backup.tar.gz /data
```

### Restauración
```bash
# Restaurar desde SQL
docker-compose exec -T mysql-db mysql -u root -p policlinicosagrado < backup.sql

# Restaurar volumen
docker run --rm -v policlinico-mysql-data:/data -v %cd%:/backup ubuntu tar xzf /backup/mysql-backup.tar.gz -C /
```

---

## 🎯 Checklist de Verificación

- [ ] Docker Desktop instalado y corriendo
- [ ] Archivo .env configurado con credenciales
- [ ] Puerto 8080 disponible
- [ ] Puerto 3307 disponible
- [ ] Aplicación compilada (target/*.jar existe)
- [ ] Contenedores iniciados (`docker-compose ps`)
- [ ] Health checks en "healthy"
- [ ] Aplicación accesible en http://localhost:8080/policlinico
- [ ] MySQL accesible en localhost:3307

---

## 📚 Recursos Adicionales

- [Documentación completa](README.md)
- [Informe técnico](INFORME_TECNICO.md)
- [Docker Documentation](https://docs.docker.com/)
- [Spring Boot Docker Guide](https://spring.io/guides/topicals/spring-boot-docker/)

---

**Última actualización:** Diciembre 2024  
**Versión:** 1.0
