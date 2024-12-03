# Portal de Juegos de Matemáticas

## Descripción del Proyecto
ss
Este proyecto es una aplicación híbrida (web y móvil) diseñada para fomentar el aprendizaje de matemáticas a través de un enfoque interactivo y competitivo. Los estudiantes podrán formar grupos, competir entre ellos en diferentes juegos matemáticos y mejorar sus habilidades en un entorno dinámico y divertido.

La aplicación también permite un seguimiento del progreso individual y grupal, fomentando la colaboración y el trabajo en equipo.

---

## Tecnologías Utilizadas

### Frontend:
- **Vue.js**: Framework para construir interfaces de usuario interactivas.
- **Quasar.js**: Framework para desarrollar aplicaciones híbridas.
- **Nuxt.js**: Framework para el desarrollo de aplicaciones Vue.js con SSR y SPA.
- **Pinia**: Gestión de estado en Vue.js.

### Backend:
- **Laravel**: Framework PHP para construir APIs robustas.
- **Node.js** y **Socket.io**: Gestión de comunicación en tiempo real entre clientes.

### Contenedor y despliegue:
- **Docker**: Contenerización de los servicios para un despliegue eficiente.
- **GitHub**: Control de versiones y colaboración.

### Otros:
- Tecnologías específicas para aplicaciones móviles: *Por definir*.

---

## Instalación y Configuración de la Web

1. Clonar el repositorio:  
   ```bash
   git clone https://github.com/usuario/proyecto-matematicas.git
   ```
2. Navegar al directorio del proyecto:  
   ```bash
   cd proyecto-matematicas
   ```
3. Configurar el entorno de desarrollo:
   - Backend:  
     ```bash
     cd backend
     cp .env.example .env
     composer install
     php artisan key:generate
     ```
   - Frontend:  
     ```bash
     cd frontend
     npm install
     ```
4. Levantar los servicios con Docker:  
   ```bash
   docker-compose up -d
   ```

---

## Instalación y Configuración de la App     

---
## Funcionalidades Principales

- **Gestión de Grupos:** Los estudiantes podrán formar y unirse a grupos.
- **Competencias Matemáticas:** Juegos dinámicos y basados en desafíos matemáticos.
- **Puntajes y Rankings:** Sistema de puntuaciones en tiempo real.
- **Progreso:** Registro del desempeño individual y grupal.

---

## Estructura del Proyecto

```
/web --> Contiene la parte web, incluyendo frontend y backend 
/web/backend --> Código del servidor con Laravel 
/web/frontend --> Interfaz de usuario con Quasar.js y Nuxt.js 
/app --> Contendrá la parte de la aplicación móvil (pendiente de desarrollo) 
README.md --> Documentación principal del proyecto
```

---

## Participantes del Proyecto

| Nombre | Rol |
|--------|-----|
| [Gerard Arias ] | --- |
| [Ayoub Boudhafri] | --- |
| [Pablo Matamoros] | --- |
| [Eduard Renau] | --- |
| [Marc Castro] | --- |
| [Albert Robert] | --- |
| [Hasham Hussain] | --- |

---

## Mentor del Equipo

| Nombre        | Contacto          |
|---------------|-------------------|
| [ Pol Prats ]    | [pprats@inspedralbes.cat]  |

---

## Links del Proyecto

- **Enlace a la aplicación web:** [https://app.ejemplo.com](https://app.ejemplo.com)
- **Repositorio en GitHub:** [https://github.com/inspedralbes/tr2-24-25-tr2_daw_dam_gomath.git](https://github.com/inspedralbes/tr2-24-25-tr2_daw_dam_gomath.git)