<template>
  <div>
    <h1>Aquí irán los apuntes</h1>
    <ul>
      <!-- Itera sobre la lista de PDFs para mostrar enlaces de descarga -->
      <li v-for="(pdf, index) in pdfs" :key="index">
        <a :href="`/matematicas/${pdf}`" download>{{ pdf }}</a>
      </li>
    </ul>
  </div>
</template>

<script>
import { inject, onMounted, ref } from 'vue';

export default {
  setup() {
    const divActivo = inject('divActivo');
    const pdfs = ref([]); // Lista de archivos PDF

    // Al montar el componente, establece el divActivo y carga la lista de PDFs
    onMounted(async () => {
      if (divActivo) {
        divActivo.value = 'apunts';
      }
      await loadPDFs();
    });

    // Carga la lista de PDFs de la carpeta 'matematicas'
    const loadPDFs = async () => {
      try {
        const response = await fetch('/matematicas'); // Endpoint para obtener los archivos
        if (!response.ok) {
          throw new Error('Error al cargar la lista de PDFs');
        }
        const files = await response.json(); // Devuelve la lista de archivos desde el backend
        pdfs.value = files.filter((file) => file.endsWith('.pdf')); // Filtra solo los archivos PDF
      } catch (error) {
        console.error(error);
      }
    };

    return { pdfs };
  },
};
</script>
