<template>
  <div class="join-or-create-game">
    <!-- Mitad izquierda: Unirse a partida mediante código -->
    <div class="card">
      <h2>Unirse a partida</h2>
      <p class="description">Ingresa el código para unirte a una partida existente.</p>
      <q-input
        v-model="inputValue"
        outlined
        label="Código de partida"
        placeholder="Introduce el código aquí"
        class="input-large"
      />
      <q-btn
        label="Unirse"
        color="primary"
        class="btn-large"
        @click="handleJoin"
      />
      <div v-if="submittedValue" class="result">
        <p>Intentando unirse con el código: <strong>{{ submittedValue }}</strong></p>
      </div>
    </div>

    <div class="card">
      <h2>Crear partida</h2>
      <p class="description">Genera una nueva partida y comparte el código con tus amigos.</p>
      <q-btn
        label="Crear partida"
        color="secondary"
        class="btn-large"
        @click="irACrearPartida"
      />
    </div>
  </div>
</template>

<script>
import { ref } from "vue";
import { useRouter } from "vue-router"
export default {
  setup() {
    const inputValue = ref(""); 
    const submittedValue = ref(""); 
    const router = useRouter();
    const handleJoin = () => {
      submittedValue.value = inputValue.value;
      console.log("Unirse con código:", inputValue.value);
    };

    function irACrearPartida () {
      router.push('/Online');
    };

    return {
      inputValue,
      submittedValue,
      handleJoin,
      irACrearPartida,
    };
  },
};
</script>

<style scoped>
.join-or-create-game {
  display: flex;
  justify-content: space-evenly;
  align-items: center;
  min-height: 70vh;
  padding: 2rem;
  gap: 2rem;
  background-color: #f9f9f9;
  border-radius: 12px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.card {
  flex: 1;
  max-width: 450px;
  height: 350px;
  background-color: white;
  border-radius: 12px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  padding: 2rem;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: center;
  text-align: center;
  transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
}

.card:hover {
  transform: translateY(-5px);
  box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
}

h2 {
  font-size: 2rem;
  margin-bottom: 0.5rem;
  color: #333;
}

.description {
  font-size: 1.1rem;
  color: #666;
  margin-bottom: 1.5rem;
  text-align: center;
}

.input-large {
  font-size: 1.25rem;
  width: 100%;
  margin-bottom: 1.5rem;
}

.btn-large {
  font-size: 1.25rem;
  padding: 0.75rem 2rem;
  border-radius: 8px;
  transition: background-color 0.3s ease-in-out;
}

.btn-large:hover {
  background-color: #004085;
}

.result {
  margin-top: 1rem;
  font-size: 1.15rem;
  color: #00796b;
  font-weight: bold;
}

@media (max-width: 768px) {
  .join-or-create-game {
    flex-direction: column;
    gap: 2rem;
  }

  .card {
    width: 100%;
  }
}
</style>
