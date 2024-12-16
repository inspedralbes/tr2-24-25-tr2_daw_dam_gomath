import { defineStore } from 'pinia';
import { ref } from 'vue';
import { useTipoPartidaStore } from '../App.vue'; 
import { useRespuesta } from '../stores/respuesta'
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

export const useUnaRespuesta = defineStore('respuesta', () => {
  const useRespuesta2 = useRespuesta(); 
  const respuestaCorrecta = ref(null); 

  async function fetchRespuesta() {
    const preguntaRespondida = {
      'id_pregunta': useRespuesta2.id_pregunta, 
      'respuestaSeleccionada': useRespuesta2.respestaActual, 
    };

    console.log('Objeto enviado a la API:', preguntaRespondida);

    try {
      const response = await fetch(`${API_BASE_URL}/unaRespuesta`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(preguntaRespondida),
      });

      if (!response.ok) {
        throw new Error(`Error ${response.status}: ${response.statusText}`);
      }

      const data = await response.json();
      console.log('Respuesta correcta a la pregunta:', data);

      // Actualizar la tienda principal con la respuesta correcta
      useRespuesta2.setCorrecta(data.respuesta_correcta);

      // Almacenar la respuesta correcta localmente
      respuestaCorrecta.value = data.respuesta_correcta;
    } catch (error) {
      console.error('Error al obtener la respuesta:', error);
    }
  }

  return {
    fetchRespuesta,
    respuestaCorrecta,
  };
});

async function fetchCodes() {
  try {
    const response = await fetch(`${API_BASE_URL}/codis`, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
      },
    });

    if (!response.ok) {
      throw new Error(`Error ${response.status}: ${response.statusText}`);
    }

    const data = await response.json();
    console.log('Fetched codes from /codis:', data);
    return data;
  } catch (err) {
    console.error('Error fetching codes from /codis:', err);
    throw err; 
  }
}

export { fetchCodes };