# Guía para Capturas de Pantalla

Esta carpeta debe contener las capturas de pantalla para el informe técnico.

## Capturas Requeridas

### 1. Build Process (`01-docker-build.png`)
**Comando a ejecutar:**
```bash
build.bat
```
**Qué capturar:**
- Terminal mostrando el proceso de compilación Maven
- Construcción de imágenes Docker
- Mensaje de éxito al final

**Herramienta:** Windows Snipping Tool (Win + Shift + S)

---

### 2. Containers Running (`02-containers-running.png`)
**Comando a ejecutar:**
```bash
docker-compose ps
```
**Qué capturar:**
- Lista de contenedores en ejecución
- Estado "Up" para ambos servicios
- Puertos mapeados visibles

---

### 3. Health Checks (`03-health-checks.png`)
**Comandos a ejecutar:**
```bash
docker inspect policlinico-app --format='{{.State.Health.Status}}'
docker inspect policlinico-mysql --format='{{.State.Health.Status}}'
```
**Qué capturar:**
- Ambos comandos mostrando "healthy"
- O usar: `docker-compose ps` que muestra el estado de salud

---

### 4. Application Running (`04-app-running.png`)
**URL a visitar:**
```
http://localhost:8080/policlinico
```
**Qué capturar:**
- Página de login del sistema
- URL visible en el navegador
- Interfaz completa y funcional

---

### 5. Volume Data (`05-volume-data.png`)
**Comandos a ejecutar:**
```bash
docker volume ls
docker volume inspect policlinico-mysql-data
```
**Qué capturar:**
- Lista de volúmenes mostrando `policlinico-mysql-data`
- Detalles del volumen con el comando inspect

---

## Instrucciones Generales

1. **Formato**: Guardar como PNG
2. **Resolución**: Mínimo 1280x720
3. **Nomenclatura**: Usar exactamente los nombres indicados arriba
4. **Calidad**: Asegurar que el texto sea legible
5. **Contexto**: Incluir suficiente contexto en cada captura

## Herramientas Recomendadas

- **Windows Snipping Tool**: Win + Shift + S
- **Snagit**: Para capturas más profesionales
- **Greenshot**: Herramienta gratuita con anotaciones

## Proceso Sugerido

```bash
# 1. Limpiar todo primero
cleanup.bat

# 2. Construir y capturar
build.bat
# → CAPTURA 01

# 3. Iniciar servicios
start.bat

# 4. Esperar 30 segundos y verificar
timeout /t 30
docker-compose ps
# → CAPTURA 02

# 5. Verificar health checks
docker inspect policlinico-app --format='{{.State.Health.Status}}'
# → CAPTURA 03

# 6. Abrir navegador
start http://localhost:8080/policlinico
# → CAPTURA 04

# 7. Verificar volúmenes
docker volume inspect policlinico-mysql-data
# → CAPTURA 05
```

## Notas Importantes

- Asegúrate de que los contenedores estén completamente iniciados antes de capturar
- Verifica que los health checks muestren "healthy" antes de la captura 03
- Para la captura 04, espera a que la página cargue completamente
- Las capturas deben mostrar información real, no simulada

## Checklist

- [ ] 01-docker-build.png
- [ ] 02-containers-running.png
- [ ] 03-health-checks.png
- [ ] 04-app-running.png
- [ ] 05-volume-data.png

Una vez completadas todas las capturas, actualiza el INFORME_TECNICO.md con las rutas correctas.
