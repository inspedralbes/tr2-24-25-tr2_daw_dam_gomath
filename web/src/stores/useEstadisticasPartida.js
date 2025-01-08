import { defineStore } from 'pinia';
import { ref } from 'vue';

const localStorageEstadisticas = 'estadisticasPartida';

export const useEstadisticasPartida = defineStore('estadisticasPartida', () => {
  const storedEstadisticas = localStorage.getItem(localStorageEstadisticas);
  
  const estadisticasPartida = ref(storedEstadisticas ? JSON.parse(storedEstadisticas) : {
    preguntasAcertadas: 0,
    preguntasFalladas: 0,
    puntos: 0,
  });

  function updateLocalStorage() {
    localStorage.setItem(localStorageEstadisticas, JSON.stringify(estadisticasPartida.value));
  }

  function setEstadisticasZero() {
    estadisticasPartida.value.preguntasAcertadas = 0;
    estadisticasPartida.value.preguntasFalladas = 0;
    estadisticasPartida.value.puntos = 0;
    updateLocalStorage();
  }

  function setPreguntaCorrecta() {
    estadisticasPartida.value.preguntasAcertadas++;
    updateLocalStorage();
    console.log(estadisticasPartida.value);
  }

  function setPreguntaIncorrecta() {
    estadisticasPartida.value.preguntasFalladas++;
    updateLocalStorage();
    console.log(estadisticasPartida.value);
  }

  function setPuntos(puntos) {
    estadisticasPartida.value.puntos += puntos;
    updateLocalStorage();
    console.log(estadisticasPartida.value);
  }

  function unSetPreguntaCorrecta() {
    estadisticasPartida.value.preguntasAcertadas--;
    estadisticasPartida.value.puntos -= 100;
    updateLocalStorage();
  }

  function unSetPreguntaIncorrecta() {
    estadisticasPartida.value.preguntasFalladas--;
    estadisticasPartida.value.puntos += +50;
    updateLocalStorage();
  }
  return {
    estadisticasPartida,
    setPreguntaCorrecta,
    setPreguntaIncorrecta,
    setPuntos,
    setEstadisticasZero,
    unSetPreguntaCorrecta,
    unSetPreguntaIncorrecta
  };
});
