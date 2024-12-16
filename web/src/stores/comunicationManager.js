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
  const respuesta = useRespuesta2.respuestaActual;
  const id_pregunta = useRespuesta2.id_pregunta;
  const respuestaCorrecta = ref(null);
  const preguntaRespondida = {
    'id_pregunta': id_pregunta,
    'respuestaSeleccionada': respuesta,
  }
  async function fetchRespuesta(){
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
    useRespuesta2.setCorrecta(data.respuesta_correcta);
    respuestaCorrecta = data.respuesta_correcta;
  }
  return {
    fetchRespuesta,
    respuestaCorrecta,
  }
});