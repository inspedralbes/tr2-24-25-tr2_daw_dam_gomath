import { defineStore } from 'pinia';
import { ref } from 'vue';

export const useEstadoOnline = defineStore('estadoOnline', () =>{
    const propietario = ref('');
    const codigoUnion = ref('');
    function setPropietario(propietari){
        propietario.value = propietari;
    }
    function setcodigoUnion (codigo){
        codigoUnion.value = codigo;
        
    }
    return {
        propietario,
        codigoUnion,
        setPropietario,
        setcodigoUnion,
    }
});