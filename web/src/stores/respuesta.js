import { defineStore } from 'pinia';
import { ref } from 'vue';

export const useRespuesta = defineStore('infoRespuesta', () =>{
    const respestaActual = ref('');
    const correcta = ref(null);
    const id_pregunta = ref(null);
    function setRespuesta(respuesta){
        respestaActual.value = respuesta;
    }
    function setCorrecta(correccion){
        correcta.value = correccion;
    }
    function setId(id){
        id_pregunta.value = id;
    }
    return {
        respestaActual,
        setRespuesta,
        setCorrecta,
        id_pregunta,
        setId,
        correcta,
    }
});