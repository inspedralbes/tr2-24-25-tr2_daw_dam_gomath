<template>
  <div class="q-pa-md botones-container">
    <!-- Dropdown para el número de preguntas -->
    <q-btn-dropdown color="primary" label="NUMERO DE PREGUNTAS" @click="tipoPartidaStore.setModo('numero')">
      <q-list>
        <q-item clickable v-close-popup @click=" tipoPartidaStore.setCantidad(10)">
          <q-item-section>
            <q-item-label>10</q-item-label>
          </q-item-section>
        </q-item>
        <q-item clickable v-close-popup @click=" tipoPartidaStore.setCantidad(20)">
          <q-item-section>
            <q-item-label>20</q-item-label>
          </q-item-section>
        </q-item>
        <q-item clickable v-close-popup @click=" tipoPartidaStore.setCantidad(30)">
          <q-item-section>
            <q-item-label>30</q-item-label>
          </q-item-section>
        </q-item>
      </q-list>
    </q-btn-dropdown>

    <!-- Dropdown para el cronómetro -->
    <q-btn-dropdown color="primary" label="CRONO" @click="tipoPartidaStore.setModo('crono')">
      <q-list>
        <q-item clickable v-close-popup @click=" tipoPartidaStore.setCantidad(30)">
          <q-item-section>
            <q-item-label>30seg</q-item-label>
          </q-item-section>
        </q-item>
        <q-item clickable v-close-popup @click=" tipoPartidaStore.setCantidad(60)">
          <q-item-section>
            <q-item-label>1min</q-item-label>
          </q-item-section>
        </q-item>
        <q-item clickable v-close-popup @click=" tipoPartidaStore.setCantidad(180)">
          <q-item-section>
            <q-item-label>3min</q-item-label>
          </q-item-section>
        </q-item>
      </q-list>
    </q-btn-dropdown>

    <q-btn-dropdown color="primary" label="HASTA QUE FALLES" @click="tipoPartidaStore.setModo('fallos')">
      <q-list>
        <q-item clickable v-close-popup  @click=" tipoPartidaStore.setCantidad(1)">
          <q-item-section>
            <q-item-label>1 Fallo</q-item-label>
          </q-item-section>
        </q-item>
        <q-item clickable v-close-popup @click=" tipoPartidaStore.setCantidad(3)">
          <q-item-section>
            <q-item-label>3 Fallos</q-item-label>
          </q-item-section>
        </q-item>
        <q-item clickable v-close-popup @click="tipoPartidaStore.setCantidad(5)">
          <q-item-section>
            <q-item-label>5 Fallos</q-item-label>
          </q-item-section>
        </q-item>
      </q-list>
    </q-btn-dropdown>
  </div>
  <div class="explicacions">
    <p><strong>Mode de Joc:</strong> Tria entre diferents opcions per adaptar el joc al teu estil i dificultat. Tens tres tipus de modes per escollir:</p>
    <ul>
      <li><strong>Numero de preguntes:</strong> Decideix quantes preguntes vols respondre durant la partida (10, 20 o 30).</li>
      <li><strong>Cronòmetre:</strong> Rep les preguntes amb un temps limitat per a cada una. Pots triar entre 30 segons, 1 minut o 3 minuts per pregunta.</li>
      <li><strong>Fins que fallis:</strong> Respon preguntes fins que cometis un nombre determinat d'errors. Tria entre 1, 3 o 5 errors màxims.</li>
    </ul>
    <p>Escull les opcions que més t'agradin per començar a jugar!</p>
  </div>
</template>

<script> 
import { useTipoPartidaStore } from '../../../App.vue';
import { inject, onMounted, ref } from 'vue';
export default {
  setup() {
      const tipoPartidaStore = useTipoPartidaStore();
      const divActivo = inject('divActivo');
      onMounted(() => {
        if (divActivo) {
          divActivo.value = 'partida';
        }
      }
    );
      return {
        tipoPartidaStore,
      };
    },
    
  data() {
    return {
      selectedQuestions: null,
      selectedCrono: null,
      selectedFails: null
    };
  },
};

</script>

<style scoped>
.botones-container {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 20px; 
}

.q-btn-dropdown {
  font-size: 16px;
  padding: 10px 20px;
  height: 50px; 
}

.q-item-label {
  font-weight: bold;
}

.explicacions {
  font-family: Arial, sans-serif;
  font-size: 16px;
  color: #333;
  padding: 20px;
  background-color: #f9f9f9;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  margin-bottom: 20px;
  margin-top: 15%;
}

.explicacions p {
  margin-bottom: 10px;
}

.explicacions ul {
  padding-left: 20px;
}

.explicacions li {
  margin-bottom: 8px;
}

.explicacions strong {
  color: #0056b3;
  font-weight: bold;
}

</style>
