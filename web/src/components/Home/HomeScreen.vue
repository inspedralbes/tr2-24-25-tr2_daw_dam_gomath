<template>
  <div id="home-screen" class="home-screen-container">
    <div class="content">
      <main>
        <h1 class="title">Benvingut a GoMath!</h1>
        <p class="description">
          Descobreix el teu nivell de matemàtiques, desafia els teus límits i millora les teves habilitats mentre et diverteixes!
        </p>
        <button v-if="muestraRegistro" class="cta-button" @click="goToRegister">Registra't ara!</button>
      </main>
      <footer>
        <p v-if="muestraRegistro" class="footer-text">Ja tens un compte?
          <a href="#" @click="goToLogin">Inicia sessió aquí</a>
        </p>
      </footer>
    </div>

  </div>
</template>

<script>
import { ref } from 'vue';
import { useAppStore } from '@/stores/app';
import { onMounted } from 'vue';
export default {
  setup(){
    const appStore = useAppStore();
    const muestraRegistro = ref(true);
    onMounted(() => {
      if (appStore.loginInfo.email !== '') {
        muestraRegistro.value = false;
      }else{
        muestraRegistro.value = true;
      }
    });
    return{
      muestraRegistro,
    }
  },
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
  background-image: url("../../assets/img/background.jpg");
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

/* Main */
.content {
  background-color: rgba(255, 255, 255, 0.85);
  border-radius: 10px;
  margin-top: 50px;
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
