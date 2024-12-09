<template>
  <div class="q-pa-md botones-container">
    <!-- Dropdown para el número de preguntas -->
    <q-btn-dropdown color="primary" label="NUMERO DE PREGUNTAS" @click="tipoPartidaStore.setModo('numero')">
      <q-list>
        <q-item clickable v-close-popup @click=" tipoPartidaStore.setCantidad('10p')">
          <q-item-section>
            <q-item-label>10</q-item-label>
          </q-item-section>
        </q-item>
        <q-item clickable v-close-popup @click=" tipoPartidaStore.setCantidad('20p')">
          <q-item-section>
            <q-item-label>20</q-item-label>
          </q-item-section>
        </q-item>
        <q-item clickable v-close-popup @click=" tipoPartidaStore.setCantidad('30p')">
          <q-item-section>
            <q-item-label>30</q-item-label>
          </q-item-section>
        </q-item>
      </q-list>
    </q-btn-dropdown>

    <!-- Dropdown para el cronómetro -->
    <q-btn-dropdown color="primary" label="CRONO" @click="tipoPartidaStore.setModo('crono')">
      <q-list>
        <q-item clickable v-close-popup @click=" tipoPartidaStore.setCantidad('30s')">
          <q-item-section>
            <q-item-label>30seg</q-item-label>
          </q-item-section>
        </q-item>
        <q-item clickable v-close-popup @click=" tipoPartidaStore.setCantidad('60s')">
          <q-item-section>
            <q-item-label>1min</q-item-label>
          </q-item-section>
        </q-item>
        <q-item clickable v-close-popup @click=" tipoPartidaStore.setCantidad('180s')">
          <q-item-section>
            <q-item-label>3min</q-item-label>
          </q-item-section>
        </q-item>
      </q-list>
    </q-btn-dropdown>

    <q-btn-dropdown color="primary" label="HASTA QUE FALLES" @click="tipoPartidaStore.setModo('fallos')">
      <q-list>
        <q-item clickable v-close-popup  @click=" tipoPartidaStore.setCantidad('1 fallo')">
          <q-item-section>
            <q-item-label>1 Fallo</q-item-label>
          </q-item-section>
        </q-item>
        <q-item clickable v-close-popup @click=" tipoPartidaStore.setCantidad('3 fallos')">
          <q-item-section>
            <q-item-label>3 Fallos</q-item-label>
          </q-item-section>
        </q-item>
        <q-item clickable v-close-popup @click="tipoPartidaStore.setCantidad('5 fallos')">
          <q-item-section>
            <q-item-label>5 Fallos</q-item-label>
          </q-item-section>
        </q-item>
      </q-list>
    </q-btn-dropdown>
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
</style>
