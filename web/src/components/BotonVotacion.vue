<script setup>
import { defineProps } from 'vue';
import { socket } from '@/socket';

const props = defineProps({
  idVoto: Object,
  votosActuales: Number
})

const enviarVotacion = (idVoto) => {
  socket.emit('votacion', idVoto);
};
</script>

<template>  
<div>
    <div>{{ props.votosActuales }} votos</div>
   
    <q-btn
    label="Votar"
    color="primary"
    @click="enviarVotacion(props.idVoto)">VOTA por la opción {{ props.idVoto }}</q-btn>
</div>
 
</template>
