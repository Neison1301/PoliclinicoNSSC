# Stage 1: Build the JAR (Usaremos Eclipse Temurin JDK 21)
FROM eclipse-temurin:21-jdk-jammy AS builder
WORKDIR /app

# Copia el JAR generado por Maven en el Job 'build' de CircleCI
COPY target/*.jar app.jar

# Stage 2: Create the final, smaller runtime image (Usaremos JRE 21)
FROM eclipse-temurin:21-jre-jammy
WORKDIR /app

# Copia el JAR del stage 'builder'
COPY --from=builder /app/app.jar /app/app.jar

# Define el punto de entrada para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]