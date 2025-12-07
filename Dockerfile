# ============================================
# Stage 1: Build Stage
# ============================================
FROM eclipse-temurin:21-jdk-jammy AS builder

# Metadata
LABEL maintainer="Policlinico NSSC Team"
LABEL description="Sistema de Gestión Policlínico NSSC - Build Stage"
LABEL version="1.0"

WORKDIR /app

# Copiar archivos de Maven
COPY pom.xml .
COPY mvnw .
COPY .mvn .mvn

# Descargar dependencias (capa cacheada)
RUN ./mvnw dependency:go-offline -B

# Copiar código fuente
COPY src ./src

# Compilar la aplicación
RUN ./mvnw clean package -DskipTests

# ============================================
# Stage 2: Runtime Stage
# ============================================
FROM eclipse-temurin:21-jre-jammy

# Metadata
LABEL maintainer="Policlinico NSSC Team"
LABEL description="Sistema de Gestión Policlínico NSSC - Runtime"
LABEL version="1.0"

WORKDIR /app

# Instalar curl para health checks
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

# Crear usuario no-root para seguridad
RUN groupadd -r spring && useradd -r -g spring spring

# Copiar el JAR del stage builder
COPY --from=builder /app/target/*.jar app.jar

# Cambiar permisos
RUN chown -R spring:spring /app

# Cambiar a usuario no-root
USER spring:spring

# Exponer puerto
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD curl -f http://localhost:8080/policlinico/actuator/health || exit 1

# Punto de entrada con configuración JVM optimizada
ENTRYPOINT ["java", \
    "-XX:+UseContainerSupport", \
    "-XX:MaxRAMPercentage=75.0", \
    "-Djava.security.egd=file:/dev/./urandom", \
    "-jar", \
    "app.jar"]

