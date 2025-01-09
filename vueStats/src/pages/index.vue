<template>
  <v-app>
    <!-- Header sin imagen ni ícono -->
    <v-app-bar color="primary" dark fixed>
      <v-row class="d-flex align-center" no-gutters>
        <!-- Título del encabezado -->
        <v-col cols="auto">
          <v-toolbar-title class="text-h5 font-weight-bold">Estadísticas de Juego</v-toolbar-title>
        </v-col>
      </v-row>
    </v-app-bar>

    <!-- Contenedor principal -->
    <v-main>
      <v-container class="main-background text-black">
        <!-- Filtro por ID -->
        <v-row>
          <v-col cols="12" md="6">
            <v-text-field
              label="Filtrar por ID"
              v-model="idFilter"
              @input="fetchPlayerStats"
              outlined
              dense
              color="primary"
              class="text-field-blue"
              prepend-icon="mdi-magnify"
              :loading="loadingPlayerStats"
              :style="{ transition: 'all 0.3s ease-in-out' }"
            ></v-text-field>
          </v-col>
        </v-row>

        <!-- Estadísticas de Jugador -->
        <v-divider class="my-4"></v-divider>
        <v-row>
          <v-col cols="12" md="6">
            <v-card class="elevated-card" elevation="4" transition="scale-transition">
              <v-card-title class="text-h6 font-weight-bold text-dark">
                Estadísticas de Jugador
              </v-card-title>
              <v-card-subtitle class="text-body-2 text-muted">
                Filtra por ID para ver las estadísticas del jugador
              </v-card-subtitle>
              <v-card-text>
                <v-data-table
                  :headers="playerHeaders"
                  :items="playerStats"
                  item-value="_id"
                  dense
                  class="elevated-table"
                  :loading="loadingPlayerStats"
                  item-class="hover-row"
                  hide-default-footer
                  transition="fade-transition"
                >
                  <template v-slot:item.created_at="{ item }">
                    <span>{{ new Date(item.created_at).toLocaleDateString() }}</span>
                  </template>
                </v-data-table>
              </v-card-text>
            </v-card>
          </v-col>
        </v-row>

        <!-- Estadísticas Generales -->
        <v-divider class="my-4"></v-divider>
        <v-row>
          <v-col cols="12" md="6">
            <v-card class="elevated-card" elevation="4" transition="scale-transition">
              <v-card-title class="text-h6 font-weight-bold text-dark">
                Estadísticas Generales
              </v-card-title>
              <v-card-text>
                <v-data-table
                  :headers="generalHeaders"
                  :items="generalStats"
                  item-value="_id"
                  dense
                  class="elevated-table"
                  :loading="loadingGeneralStats"
                  item-class="hover-row"
                  hide-default-footer
                  transition="fade-transition"
                >
                  <template v-slot:item.created_at="{ item }">
                    <span>{{ new Date(item.created_at).toLocaleDateString() }}</span>
                  </template>
                </v-data-table>
              </v-card-text>
            </v-card>
          </v-col>
        </v-row>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
export default {
  data() {
    return {
      idFilter: "", // Filtro por ID
      playerStats: [],
      generalStats: [],
      playerHeaders: [
        { text: "ID", value: "_id" },
        { text: "Tipo de Juego", value: "game_type" },
        { text: "Rondas Totales", value: "total_rounds" },
        { text: "Tiempo de Sesión", value: "session_time" },
        { text: "Fecha", value: "created_at" },
      ],
      generalHeaders: [
        { text: "ID del Jugador", value: "player_id" },
        { text: "Respuestas Correctas", value: "correct_answers" },
        { text: "Respuestas Incorrectas", value: "incorrect_answers" },
        { text: "Fecha", value: "created_at" },
      ],
      loadingPlayerStats: false,
      loadingGeneralStats: false,
    };
  },
  methods: {
    async fetchPlayerStats() {
      if (!this.idFilter) {
        this.playerStats = [];
        return;
      }
      this.loadingPlayerStats = true;
      try {
        const response = await fetch(`http://localhost:3000/api/offlineGames/${this.idFilter}`);
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
        const response = await fetch(`http://localhost:3000/api/offlineGames`);
        if (!response.ok) throw new Error("Error al obtener estadísticas generales");
        const data = await response.json();
        this.generalStats = data.map((game) => {
          const correctAnswers = game.questions.filter(
            (q) => q.correct_response === q.current_response
          ).length;
          const incorrectAnswers = game.questions.length - correctAnswers;
          return {
            player_id: game.player_id,
            correct_answers: correctAnswers,
            incorrect_answers: incorrectAnswers,
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
  },
  mounted() {
    this.fetchGeneralStats();
  },
};
</script>

<style scoped>
  /* Estilo para el header */
  .v-app-bar {
    background-color: #2196F3;
    z-index: 10; /* Asegura que el encabezado esté encima del contenido */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Sombra para el encabezado */
  }

  /* Fondo blanco, texto en negro */
  html, body, #app {
    margin: 0;
    padding: 0;
    width: 100%;
    height: 100%;
    background-color: #FFFFFF;
  }

  .v-application {
    min-height: 100vh;
    background-color: #FFFFFF;
  }

  .main-background {
    padding: 24px;
    background-color: #FFFFFF;
  }

  .text-dark {
    color: #000000 !important;
  }

  .text-field-blue .v-input__control {
    background-color: #E3F2FD;
    color: #0D47A1;
    border-radius: 8px;
    transition: all 0.3s ease;
  }

  .text-field-blue .v-input__control:focus-within {
    background-color: #BBDEFB;
    box-shadow: 0 0 5px rgba(0, 82, 155, 0.6);
  }

  .elevated-table {
    background-color: #FFFFFF;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    color: black; /* Cambia el color a uno visible */;
  }

  .elevated-table .v-data-table__wrapper {
    background-color: #FFFFFF;
    border-radius: 8px;
  }

  .elevated-card {
    background-color: #F5F5F5;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease-in-out;
  }

  .elevated-card:hover {
    transform: scale(1.02);
  }

  .elevated-card .v-card-title {
    background-color: #2196F3;
    color: #E3F2FD;
    padding: 12px;
    font-weight: bold;
    font-size: 1rem;
    border-radius: 8px 8px 0 0;
  }

  .elevated-card .v-card-subtitle {
    color: #757575;
    padding: 0 12px 12px;
  }

  .hover-row:hover {
    background-color: #BBDEFB;
  }

  .elevated-table .v-data-table__row {
    transition: background-color 0.3s ease;
  }

  .elevated-table .v-data-table__row:hover {
    background-color: #BBDEFB;
  }

  .v-input--dense {
    margin-bottom: 16px;
  }

  /* Transiciones */
  .fade-transition {
    transition: opacity 0.3s ease;
  }

  .scale-transition {
    transition: transform 0.3s ease-in-out;
  }
</style>
