<template>
  <v-container>
    <!-- Estadísticas Generales -->
    <v-card outlined class="elevated-card">
      <v-card-title class="blue lighten-1 white--text">Estadístiques Generals</v-card-title>
      <v-card-text>
        <v-data-table
          :headers="generalHeaders"
          :items="filteredGeneralStats"
          item-value="player_email"
          dense
          class="elevated-table"
          :loading="loadingGeneralStats"
          hide-default-footer
          transition="fade-transition"
          hide-header
        >
          <template v-slot:top>
            <v-row class="font-weight-bold text-center table-header">
              <v-col cols="3">Correu Electrònic del Jugador</v-col>
              <v-col cols="3">Respostes Correctes</v-col>
              <v-col cols="3">Respostes Incorrectes</v-col>
              <v-col cols="3">Data</v-col>
            </v-row>
          </template>
          <template v-slot:item="{ item }">
            <v-row class="text-center hover-row table-row">
              <v-col cols="3">{{ item.player_email }}</v-col>
              <v-col cols="3">{{ item.preguntasAcertadas }}</v-col>
              <v-col cols="3">{{ item.preguntasFallidas }}</v-col>
              <v-col cols="3">{{ new Date(item.created_at).toLocaleDateString() }}</v-col>
            </v-row>
          </template>
        </v-data-table>
      </v-card-text>
    </v-card>

    <!-- Botón para generar gráficos -->
    <v-btn @click="generarGraficos" color="primary" class="mt-4">
      Generar Gràfics
    </v-btn>

    <!-- Mostrar las gráficas generadas -->
    <div v-if="graficoGenerado" class="mt-5">
      <v-img :src="graficoUrl" max-width="100%" />
    </div>

    <!-- Botón de Volver -->
    <v-btn @click="goBack" color="secondary" class="mt-4">
      Tornar
    </v-btn>
  </v-container>
</template>

<script>
export default {
  data() {
    return {
      generalStats: [],
      generalHeaders: [
        { text: "Correu Electrònic del Jugador", value: "player_email" },
        { text: "Respostes Correctes", value: "preguntasAcertadas" },
        { text: "Respostes Incorrectes", value: "preguntasFallidas" },
        { text: "Data", value: "created_at" },
      ],
      loadingGeneralStats: false,
      graficoGenerado: false, // Variable para saber si el gráfico fue generado
      graficoUrl: "", // URL del gráfico generado
    };
  },
  computed: {
    filteredGeneralStats() {
      return this.generalStats;
    },
  },
  methods: {
    async fetchGeneralStats() {
      this.loadingGeneralStats = true;
      try {
        const response = await fetch(`http://localhost:3000/api/onlineGames`);
        if (!response.ok) throw new Error("Error al obtenir estadístiques generals");
        const data = await response.json();
        
        this.generalStats = data.map((game) => {
          return {
            player_email: game.player_email,
            preguntasAcertadas: game.preguntasAcertadas,
            preguntasFallidas: game.preguntasFallidas,
            created_at: game.created_at,
          };
        });
      } catch (error) {
        console.error(error);
        this.generalStats = [];
      } finally {
        this.loadingGeneralStats = false;
      }
    },
    async generarGraficos() {
      try {
        const response = await fetch("http://localhost:3000/api/generar-graficos", {
          method: "GET",
        });
        const data = await response.json();

        if (data.graficoPuntosUrl && data.graficoAciertosErroresUrl) {
          this.graficoUrl = data.graficoPuntosUrl; // Ajusta según cuál gráfico quieras mostrar
          this.graficoGenerado = true;
        } else {
          console.error("No se pudo generar el gráfico.");
        }
      } catch (error) {
        console.error("Error al generar los gráficos:", error);
      }
    },
    goBack() {
      window.location.href = "http://gomath.daw.inspedralbes.cat/"; // Redirige al enlace proporcionado
    }
  },
  mounted() {
    this.fetchGeneralStats();
  }
};
</script>

<style>
.v-application {
  min-height: 100vh;
  background-color: #ffffff;
}

.elevated-table .v-data-table-header {
  display: none;
}

.elevated-table .v-data-table__header {
  display: none;
}

.elevated-table .v-data-table__wrapper {
  padding-top: 0 !important;
}

.elevated-table thead {
  display: none;
}

.table-row {
  display: flex;
  align-items: center;
  justify-content: center;
}

.table-row,
.table-header {
  margin: 0;
  padding: 0;
}

.table-header {
  font-weight: bold;
}

.text-field-blue .v-input__control {
  background-color: #e3f2fd;
  color: #0d47a1;
  border-radius: 8px;
  transition: all 0.3s ease;
}

.text-field-blue .v-input__control:focus-within {
  background-color: #bbdefb;
  box-shadow: 0 0 5px rgba(0, 82, 155, 0.6);
}

.elevated-table {
  border: 1px solid #ccc;
  border-radius: 8px;
  background-color: #ffffff;
  color: black;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.elevated-table .v-data-table__row:hover {
  background-color: #bbdefb;
}

.elevated-card {
  background-color: #f5f5f5;
  border-radius: 8px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease-in-out;
}

.elevated-card:hover {
  background-color: #2196f3;
}

.elevated-card .v-card-title {
  background-color: #2196f3;
  color: #e3f2fd;
  padding: 12px;
  font-weight: bold;
  font-size: 1rem;
  border-radius: 8px 8px 0 0;
}

.hover-row:hover {
  background-color: #2196f3;
}

.fade-transition {
  transition: opacity 0.3s ease;
}

/* Estilos adicionales para los gráficos */
.mt-5 {
  margin-top: 20px;
}

.mt-4 {
  margin-top: 15px;
}
</style>
