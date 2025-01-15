<template>
  <v-container>
    <!-- Filtro por ID -->
    <v-text-field
      v-model="idFilter"
      label="Filtrar por ID"
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
          :items="playerStats"
          item-value="_id"
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
                <v-col cols="3">ID</v-col>
                <v-col cols="3">Tipo de Juego</v-col>
                <v-col cols="3">Rondas Totales</v-col>
                <v-col cols="3">Fecha</v-col>
              </v-row>
            </template>
            <template v-slot:item="{ item }">
              <v-row class="text-center hover-row table-row">
                <v-col cols="3">{{ item.id }}</v-col>
                <v-col cols="3">{{ item.game_type }}</v-col>
                <v-col cols="3">{{ item.total_rounds }}</v-col>
                <v-col cols="3">{{ new Date(item.date).toLocaleDateString() }}</v-col>
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
          :items="generalStats"
          item-value="_id"
          dense
          class="elevated-table"
          :loading="loadingGeneralStats"
          hide-default-footer
          transition="fade-transition"
          hide-header
        >
          <template v-slot:top>
            <v-row class="font-weight-bold text-center table-header">
              <v-col cols="3">ID del Jugador</v-col>
              <v-col cols="3">Respuestas Correctas</v-col>
              <v-col cols="3">Respuestas Incorrectas</v-col>
              <v-col cols="3">Fecha</v-col>
            </v-row>
          </template>
          <template v-slot:item="{ item }">
            <v-row class="text-center hover-row table-row">
              <v-col cols="3">{{ item.player_id }}</v-col>
              <v-col cols="3">{{ item.correct_answers }}</v-col>
              <v-col cols="3">{{ item.incorrect_answers }}</v-col>
              <v-col cols="3">{{ new Date(item.created_at).toLocaleDateString() }}</v-col>
            </v-row>
          </template>
        </v-data-table>
      </v-card-text>
    </v-card>
    
  </v-container>
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
    const header = document.querySelector('.elevated-table .v-data-table__header');
    if (header) header.style.display = 'none';
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
</style>
