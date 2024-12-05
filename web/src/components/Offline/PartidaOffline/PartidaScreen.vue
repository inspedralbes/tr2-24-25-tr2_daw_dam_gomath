<template>
  <div class="q-pa-md botones-container">
    <!-- Dropdown para el número de preguntas -->
    <q-btn-dropdown color="primary" label="NUMERO DE PREGUNTAS" @click="cambioCantidad('numero')">
      <q-list>
        <q-item clickable v-close-popup @click="() => { peticioOperacions(); cambioModo('10p'); }">
          <q-item-section>
            <q-item-label>10</q-item-label>
          </q-item-section>
        </q-item>
        <q-item clickable v-close-popup @click="() => { peticioOperacions(); cambioModo('20p'); }">
          <q-item-section>
            <q-item-label>20</q-item-label>
          </q-item-section>
        </q-item>
        <q-item clickable v-close-popup @click="() => { peticioOperacions(); cambioModo('30p'); }">
          <q-item-section>
            <q-item-label>30</q-item-label>
          </q-item-section>
        </q-item>
      </q-list>
    </q-btn-dropdown>

    <!-- Dropdown para el cronómetro -->
    <q-btn-dropdown color="primary" label="CRONO" @click="cambioCantidad('crono')">
      <q-list>
        <q-item clickable v-close-popup @click="() => { peticioOperacions(); cambioModo('30s'); }">
          <q-item-section>
            <q-item-label>30seg</q-item-label>
          </q-item-section>
        </q-item>
        <q-item clickable v-close-popup @click="() => { peticioOperacions(); cambioModo('60s'); }">
          <q-item-section>
            <q-item-label>1min</q-item-label>
          </q-item-section>
        </q-item>
        <q-item clickable v-close-popup @click="() => { peticioOperacions(); cambioModo('180s'); }">
          <q-item-section>
            <q-item-label>3min</q-item-label>
          </q-item-section>
        </q-item>
      </q-list>
    </q-btn-dropdown>

    <q-btn-dropdown color="primary" label="HASTA QUE FALLES" @click="cambioCantidad('fallos')">
      <q-list>
        <q-item clickable v-close-popup  @click="() => { peticioOperacions(); cambioModo('1 fallo'); }">
          <q-item-section>
            <q-item-label>1 Fallo</q-item-label>
          </q-item-section>
        </q-item>
        <q-item clickable v-close-popup @click="() => { peticioOperacions(); cambioModo('3 fallos'); }">
          <q-item-section>
            <q-item-label>3 Fallos</q-item-label>
          </q-item-section>
        </q-item>
        <q-item clickable v-close-popup @click="() => { peticioOperacions(); cambioModo('5 fallos'); }">
          <q-item-section>
            <q-item-label>5 Fallos</q-item-label>
          </q-item-section>
        </q-item>
      </q-list>
    </q-btn-dropdown>
  </div>
</template>

<script>
import { useOperationsStore } from '@/stores/comunicationManager';  
import { inject } from 'vue';
export default {
  setup() {
      const tipoPartida = inject('tipoPartida');

      function cambioModo(modo){
        if (tipoPartida) {
        tipoPartida.value.modo = modo;
        console.log('Soy el modo de juego',tipoPartida.value);
        
        }
      }
      function cambioCantidad(cantidad){
        if (tipoPartida) {
        tipoPartida.value.cantidad = cantidad;
        console.log('Soy cantidad',tipoPartida.value);
        
        }
      }
      return {
        cambioModo,
        cambioCantidad,
      };
    },
  data() {
    return {
      selectedQuestions: null,
      selectedCrono: null,
      selectedFails: null
    };
  },
  methods: {
    peticioOperacions() {
      this.cargarOperacions();
    },

    async cargarOperacions() {
      const fetchDeOperaciones = useOperationsStore();  
      await fetchDeOperaciones.fetchOperations();  
    },
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
