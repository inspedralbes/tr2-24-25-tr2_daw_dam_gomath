<template>
  <div id="home-screen" class="home-screen-container">
    <header>
      <img src="/path/to/logo.png" alt="MathQuest Logo" class="logo" />
    </header>
    <main>
      <h1 class="title">Bienvenido a MathQuest</h1>
      <p class="description">
        ¡Descubre tu nivel de matemáticas, desafía tus límites y mejora tus habilidades mientras te diviertes!
      </p>
      <button class="cta-button" @click="goToRegister">¡Regístrate ahora!</button>
    </main>
    <footer>
      <p class="footer-text">¿Ya tienes una cuenta?
        <a href="#" @click="goToLogin">Inicia sesión aquí</a>
      </p>
    </footer>
  </div>
</template>

<script>
export default {
  name: "HomeScreen",
  methods: {
    goToRegister() {
      this.$router.push("/register");
    },
    goToLogin() {
      this.$router.push("/login");
    },
  },
};
</script>

<style scoped>
/* Estilos base */
.home-screen-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-between;
  height: 100vh;
  
  font-family: 'Aller', sans-serif;
  padding: 20px;
  text-align: center;
  text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.75);
}

/* Header */
.logo {
  width: 150px;
  margin-top: 20px;
}

/* Título */
.title {
  font-family: 'Blogger Sans', sans-serif;
  color: #292f36;
  font-size: 3rem;
  margin-bottom: 1rem;
}

/* Descripción */
.description {
  color: #153ee6;
  font-size: 1.5rem;
  margin-bottom: 2rem;
  max-width: 600px;
}

/* Botón de llamada a la acción */
.cta-button {
  background-color: #4ecdc4;
  color: #fff;
  font-size: 1.5rem;
  padding: 15px 30px;
  border: none;
  border-radius: 30px;
  cursor: pointer;
  transition: background-color 0.3s ease, transform 0.2s ease;
}

.cta-button:hover {
  background-color: #292f36;
  transform: scale(1.05);
}

/* Footer */
.footer-text {
  font-size: 1rem;
  color: #292f36;
}

.footer-text a {
  color: #4ecdc4;
  font-weight: bold;
  text-decoration: none;
}

.footer-text a:hover {
  text-decoration: underline;
}
</style>
