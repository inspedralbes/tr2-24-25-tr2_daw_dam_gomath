<script>
  import { inject, onMounted } from 'vue';
  
  export default {
    setup() {
      const divActivo = inject('divActivo'); 
  
      onMounted(() => {
        if (divActivo) {
          divActivo.value = 'jocs';
        }
      });
  
      return {};
    },
  };
  </script>
  <template>
    <h1>Aqui aniran els jocs</h1>
  </template>