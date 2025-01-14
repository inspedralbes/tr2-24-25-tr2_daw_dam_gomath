<template>
  <v-container>
    <!-- Filtro por correo de jugador -->
    <v-text-field
      v-model="emailFilter"
      label="Filtrar per Correu Electrònic"
      outlined
      dense
      class="mb-5 text-field-blue"
      hide-details
    ></v-text-field>

    <!-- Estadísticas de Jugador -->
    <v-card outlined class="mb-5 elevated-card">
      <v-card-title class="blue lighten-1 white--text">Estadísticas de Jugador</v-card-title>
      <v-card-text>
        <v-data-table
          :headers="playerHeaders"
          :items="filteredPlayerStats"
          item-value="player_email"
          dense
          class="elevated-table"
          :loading="loadingPlayerStats"
          hide-default-footer
          no-data-text="No data available"
          transition="fade-transition"
          hide-header
        >
          <v-container>
            <template v-slot:top>
              <v-row class="font-weight-bold text-center table-header">
                <v-col cols="3">Correu Electrònic</v-col>
                <v-col cols="3">Tipus de Joc</v-col>
                <v-col cols="3">Rondes Totals</v-col>
                <v-col cols="3">Data</v-col>
              </v-row>
            </template>
            <template v-slot:item="{ item }">
              <v-row class="text-center hover-row table-row">
                <v-col cols="3">{{ item.player_email }}</v-col>
                <v-col cols="3">{{ item.session_id }}</v-col>
                <v-col cols="3">{{ item.preguntasAcertadas + item.preguntasFallidas }}</v-col>
                <v-col cols="3">{{ new Date(item.created_at).toLocaleDateString() }}</v-col>
              </v-row>
            </template>
          </v-container>
        </v-data-table>
      </v-card-text>
    </v-card>

    <!-- Estadísticas Generales -->
    <v-card outlined class="elevated-card">
      <v-card-title class="blue lighten-1 white--text">Estadísticas Generales</v-card-title>
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
  </v-container>
</template>

<script>
export default {
  data() {
    return {
      emailFilter: "",
      playerStats: [],
      generalStats: [],
      playerHeaders: [
        { text: "Correu Electrònic", value: "player_email" },
        { text: "Tipus de Joc", value: "session_id" },
        { text: "Rondes Totals", value: "total_rounds" },
        { text: "Data", value: "created_at" },
      ],
      generalHeaders: [
        { text: "Correu Electrònic del Jugador", value: "player_email" },
        { text: "Respostes Correctes", value: "preguntasAcertadas" },
        { text: "Respostes Incorrectes", value: "preguntasFallidas" },
        { text: "Data", value: "created_at" },
      ],
      loadingPlayerStats: false,
      loadingGeneralStats: false,
      graficoGenerado: false, // Variable para saber si el gráfico fue generado
      graficoUrl: "", // URL del gráfico generado
    };
  },
  computed: {
    filteredPlayerStats() {
      if (!this.emailFilter) {
        return this.playerStats;
      }
      return this.playerStats.filter(item =>
        item.player_email.toLowerCase().includes(this.emailFilter.toLowerCase())
      );
    },
    filteredGeneralStats() {
      if (!this.emailFilter) {
        return this.generalStats;
      }
      return this.generalStats.filter(item =>
        item.player_email.toLowerCase().includes(this.emailFilter.toLowerCase())
      );
    },
  },
  methods: {
    async fetchPlayerStats() {
      this.loadingPlayerStats = true;
      try {
        const response = await fetch(`http://localhost:3000/api/onlineGames`);
        if (!response.ok) throw new Error("Error al obtener estadísticas del jugador");
        this.playerStats = await response.json();
      } catch (error) {
        console.error(error);
        this.playerStats = [];
      } finally {
        this.loadingPlayerStats = false;
      }
    },
    async fetchGeneralStats() {
      this.loadingGeneralStats = true;
      try {
        const response = await fetch(`http://localhost:3000/api/onlineGames`);
        if (!response.ok) throw new Error("Error al obtener estadísticas generales");
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

    if (data.graficoUrl) {
      this.graficoUrl = data.graficoUrl;
    } else {
      console.error("No se pudo generar el gráfico.");
    }
  } catch (error) {
    console.error("Error al generar los gráficos:", error);
  }
}

  },
  mounted() {
    this.fetchGeneralStats();
    this.fetchPlayerStats();
  },
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
