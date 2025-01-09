<template>
  <div class="contenedor">
    <p class="titulo">Aquí hi ha alguns apunts amb exercicis que els pots imprimir per practicar a mà:</p>
    <ul class="lista">
      <li v-for="archivo in archivos" :key="archivo" class="item">
        <a :href="`/Matematiques/${archivo}`" target="_blank" download class="enlace">
          {{ archivo }}
        </a>
      </li>
    </ul>
  </div>
</template>

<script>
import { inject, onMounted } from 'vue';

export default {
  setup() {
    const divActivo = inject('divActivo');

    // Lista de archivos PDF
    const archivos = [
      'Dossier_Exercicis_Figures en el pla i angles.pdf',
      'Dossier_Exercicis_Nombres i Operacions.pdf',
      'Dossier_Exercicis_Teorema de Pitàgores, Perímetres i Àrees.pdf',
      'Dossier_Tema 2_Proporcionalitat i percentatges.pdf',
    ];

    onMounted(() => {
      if (divActivo) {
        divActivo.value = 'apunts';
      }
    });

    return {
      archivos, // Devuelve la lista para usarla en el template
    };
  },
};
</script>
<style scoped>
.contenedor {
  font-family: Arial, sans-serif;
  max-width: 600px;
  margin: 20px auto;
  padding: 20px;
  background-color: #f9f9f9;
  border: 1px solid #ddd;
  border-radius: 8px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.titulo {
  font-size: 20px;
  font-weight: bold;
  color: #333;
  margin-bottom: 15px;
  text-align: center;
}

.lista {
  list-style: none;
  padding: 0;
  margin: 0;
}

.item {
  margin: 10px 0;
  padding: 8px;
  border-bottom: 1px solid #ddd;
  transition: background-color 0.3s;
}

.item:last-child {
  border-bottom: none;
}

.item:hover {
  background-color: #e6f7ff;
}

.enlace {
  text-decoration: none;
  color: #007acc;
  font-size: 16px;
  font-weight: 500;
}

.enlace:hover {
  color: #005b99;
  text-decoration: underline;
}
</style>