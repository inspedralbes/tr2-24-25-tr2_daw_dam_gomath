<template>
  <div class="join-or-create-game">
    <!-- Mitad izquierda: Unirse a partida mediante código -->
    <div class="card">
      <h2>Unirse a partida</h2>
      <p class="description">Ingresa el código para unirte a una partida existente.</p>
      <q-input v-model="inputValue" outlined label="Código de partida" placeholder="Introduce el código aquí"
        class="input-large" />
      <q-btn label="Unirse" color="primary" class="btn-large" @click="handleJoin" />
      <div v-if="submittedValue" class="result">
        <p>Intentando unirse con el código: <strong>{{ submittedValue }}</strong></p>
      </div>
    </div>

    <div class="card">
      <h2>Crear partida</h2>
      <p class="description">Genera una nueva partida y comparte el código con tus amigos.</p>
      <q-btn label="Crear partida" color="secondary" class="btn-large" @click="irACrearPartida" />
    </div>

    <!-- Mensaje de error -->
    <q-dialog v-model="showError" persistent>
      <q-card class="bg-red text-white">
        <q-card-section>
          <div class="text-h6">Error</div>
          <p>{{ errorMessage }}</p>
        </q-card-section>
        <q-card-actions align="right">
          <q-btn flat label="Cerrar" color="white" @click="showError = false" />
        </q-card-actions>
      </q-card>
    </q-dialog>
  </div>
</template>
<script>
import { ref } from "vue";
import { useRouter } from "vue-router";
import { useCodigoSala } from "@/stores/comunicationManager";
import { useEstadoOnline } from "@/stores/estadoOnline"
export default {
  setup() {
    const estadoOnline = useEstadoOnline();
    const router = useRouter();
    const inputValue = ref("");
    const showError = ref(false);
    const errorMessage = ref("");
    const sala = useCodigoSala();

    const handleJoin = async () => {
      try {
        const response = await fetch(`http://localhost:3000/api/salas/${inputValue.value}`);
        if (!response.ok) {
          throw new Error("No se pudo verificar la sala.");
        }
        const data = await response.json();
        if (data.existe) {
          sala.codigo = inputValue.value;
          estadoOnline.setPropietario('otro');
          estadoOnline.setcodigoUnion(inputValue.value);
          console.log('aqui añado valor al codigounion',inputValue.value);
          
          router.push("/Online/CodigoPartida");
        } else {
          throw new Error("El código no corresponde a una sala existente.");
        }
      } catch (error) {
        errorMessage.value = "Código incorrecto, sala no existente";
        showError.value = true;
      }
    };

    function irACrearPartida() {
      estadoOnline.setPropietario('yo');
      console.log(estadoOnline.propietario);
      
      router.push("/Online");
    }

    return {
      inputValue,
      showError,
      errorMessage,
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
