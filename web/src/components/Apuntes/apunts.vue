<template>
  <h1>Aqui aniran els apunts</h1>
</template>
<script>
import { inject, onMounted } from 'vue';

export default {
  setup() {
    const divActivo = inject('divActivo');

    onMounted(() => {
      if (divActivo) {
        divActivo.value = 'apunts';
      }
    });

    return {};
  },
};
</script>
