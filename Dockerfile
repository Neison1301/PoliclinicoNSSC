# Stage 1: Build the JAR (Aunque CircleCI ya lo hace, es una buena práctica incluir esta etapa)
FROM openjdk:21-jdk-slim-bullseye AS builder
WORKDIR /app

# Copia el JAR generado por Maven en el Job 'build' de CircleCI
# Nota: La ruta 'target/*.jar' asume que el JAR fue creado por Maven
COPY target/*.jar app.jar

# Stage 2: Create the final, smaller runtime image
FROM openjdk:21-jre-slim-bullseye
WORKDIR /app

# Copia el JAR del stage 'builder'
COPY --from=builder /app/app.jar /app/app.jar

# Define el punto de entrada para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]