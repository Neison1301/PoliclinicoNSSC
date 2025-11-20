# Stage 1: Build the JAR (Usaremos una imagen base más simple y directa de JDK 21)
FROM openjdk:21 AS builder
WORKDIR /app

# Copia el JAR generado por Maven en el Job 'build' de CircleCI
COPY target/*.jar app.jar

# Stage 2: Create the final, smaller runtime image (Usaremos la JRE más simple y directa)
FROM openjdk:21-jre
WORKDIR /app

# Copia el JAR del stage 'builder'
COPY --from=builder /app/app.jar /app/app.jar

# Define el punto de entrada para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]