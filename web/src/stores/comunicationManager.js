import { defineStore } from 'pinia';
import { ref } from 'vue';

const API_BASE_URL = import.meta.env.VITE_API_BASE_URL;

export const useOperationsStore = defineStore('operations', () => {
  const operations = ref([]);
  const loading = ref(false);
  const error = ref(null);

  async function fetchOperations(){
    loading.value = true;
    error.value = null;

    try {
        const response = await fetch(`${API_BASE_URL}/operacions`);
      if (!response.ok) {
        throw new Error(`Error ${response.status}: ${response.statusText}`);
      }
      const data = await response.json();
      console.log(data);
      
      operations.value = data;
    } catch (err) {
      error.value = err.message;
    } finally {
      loading.value = false;
    }
  };

  return {
    operations,
    loading,
    error,
    fetchOperations,
  };
});
