import { defineStore } from 'pinia';
import { ref } from 'vue';
import { useTipoPartidaStore } from '../App.vue'; 
const API_BASE_URL = import.meta.env.VITE_API_BASE_URL;

export const useOperationsStore = defineStore('operations', () => {
  const operations = ref([]);
  const loading = ref(false);
  const error = ref(null);

  const tipoPartidaStore = useTipoPartidaStore();

  async function fetchOperations() {
    loading.value = true;
    error.value = null;

    try {
      const tipoPartidaJson = tipoPartidaStore.tipoPartida;
      console.log('json antes de mandarse',tipoPartidaJson)

      const response = await fetch(`${API_BASE_URL}/operacionsFiltro`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(tipoPartidaJson),
        
      });

      if (!response.ok) {
        throw new Error(`Error ${response.status}: ${response.statusText}`);
      }

      const data = await response.json();
      console.log('Response from server:', data);

      operations.value = data;
    } catch (err) {
      error.value = err.message;
      console.error('Error sending tipoPartida:', err);
    } finally {
      loading.value = false;
    }
  }

  return {
    operations,
    loading,
    error,
    fetchOperations
  };
});
