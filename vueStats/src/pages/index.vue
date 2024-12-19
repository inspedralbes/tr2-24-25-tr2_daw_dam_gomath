<template>
  <v-container>
    <v-row>
      <v-col cols="12">
        <v-text-field
          label="Filtrar por correo electrónico"
          v-model="emailFilter"
          @input="fetchPlayerStats"
        ></v-text-field>
      </v-col>
    </v-row>

    <v-row>
      <v-col cols="12">
        <h2>Estadísticas de Jugador</h2>
        <v-data-table
          :headers="playerHeaders"
          :items="playerStats"
          item-value="_id"
        ></v-data-table>
      </v-col>
    </v-row>

    <v-row>
      <v-col cols="12">
        <h2>Estadísticas Generales</h2>
        <v-data-table
          :headers="generalHeaders"
          :items="generalStats"
          item-value="_id"
        ></v-data-table>
      </v-col>
    </v-row>
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
        { text: "ID", value: "_id" },
        { text: "Tipo de Juego", value: "game_type" },
        { text: "Rondas Totales", value: "total_rounds" },
        { text: "Tiempo de Sesión", value: "session_time" },
        { text: "Fecha", value: "created_at" },
      ],
      generalHeaders: [
        { text: "ID", value: "_id" },
        { text: "Jugador", value: "player_id" },
        { text: "Tipo de Juego", value: "game_type" },
        { text: "Rondas Totales", value: "total_rounds" },
        { text: "Tiempo de Sesión", value: "session_time" },
        { text: "Fecha", value: "created_at" },
      ],
    };
  },
  methods: {
    async fetchPlayerStats() {
      if (!this.emailFilter) {
        this.playerStats = [];
        return;
      }
      try {
        const response = await fetch(`/api/offlineGames/${this.emailFilter}`);
        if (!response.ok) throw new Error("Error al obtener estadísticas del jugador");
        this.playerStats = await response.json();
      } catch (error) {
        console.error(error);
        this.playerStats = [];
      }
    },
    async fetchGeneralStats() {
      try {
        const response = await fetch(`/api/offlineGames`);
        if (!response.ok) throw new Error("Error al obtener estadísticas generales");
        this.generalStats = await response.json();
      } catch (error) {
        console.error(error);
        this.generalStats = [];
      }
    },
  },
  mounted() {
    this.fetchGeneralStats();
  },
};
</script>
