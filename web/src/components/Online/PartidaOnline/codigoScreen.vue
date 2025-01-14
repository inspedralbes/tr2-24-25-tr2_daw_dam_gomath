<template>
  <div class="container">
    <div class="card">
      <div class="card-header">
        <h3>¡Comparte tu código!</h3>
      </div>
      <div class="card-body">
        <div class="code-display">{{ codigoSala }}</div>
        <p>Invita a tus amigos para unirse a la partida.</p>
      </div>
    </div>

    <div class="card">
      <div class="card-header">
        <h3>Jugadores en la partida</h3>
      </div>
      <div class="card-body players-list">
        <div v-for="player in players" :key="player.id" class="player-item">
          <img :src="player.fotoPerfil" alt="Foto de perfil" class="profile-pic" />
          <span>{{ player.name }}</span>
        </div>
      </div>
    </div>

    <q-btn v-if="empezarPartidaBtn" class="start-btn" label="Comenzar partida" color="primary"
      @click="hostEmpiezaPartida" />
  </div>
</template>

<script>
import { ref, onMounted, onUnmounted } from "vue";
import { useRouter } from "vue-router";
import io from "socket.io-client";
import { useCodigoSala } from "@/stores/comunicationManager";
import { useAppStore } from "@/stores/app";
import { useEstadoOnline } from "@/stores/estadoOnline";
import { useTipoPartidaStore } from "@/App.vue";

export default {
  setup() {
    const router = useRouter();
    const socket = io("http://localhost:3000", {
      transports: ["websocket"],
    });
    const codigoSala = ref("");
    const players = ref([]);
    const empezarPartidaBtn = ref(false);
    const tipoPartidaNode = ref(null);

    const tipoPartida = useTipoPartidaStore();
    const loginInfo = useAppStore();
    const estadoOnline = useEstadoOnline();
    const sala = useCodigoSala();

    onMounted(async () => {
      console.log("el propietario es: ", estadoOnline.propietario);

      if (estadoOnline.propietario === "yo") {
        sala.fetchCodigo().then(async () => {
          codigoSala.value = sala.codigo;
          empezarPartidaBtn.value = true;
          console.log("eres host");

          const union = async () => {
            socket.emit("join-room", {
              roomCode: codigoSala.value,
              username: loginInfo.loginInfo.username || "Jugador",
              fotoPerfil: loginInfo.loginInfo.image,
            });
          };
          await union();
          socket.emit("tipoPartidaHost", {
            tipoPartida: tipoPartida.tipoPartida,
            codigoSala: codigoSala.value,
          });
        });
      } else if (estadoOnline.propietario === "otro") {
        codigoSala.value = estadoOnline.codigoUnion;
        empezarPartidaBtn.value = false;
        socket.emit("join-room", {
          roomCode: codigoSala.value,
          username: loginInfo.loginInfo.username || "Jugador",
          fotoPerfil: loginInfo.loginInfo.image,
        });

        socket.on("tipoPartidaUser", (data) => {
          if (data.tipoPartida) {
            tipoPartidaNode.value = data.tipoPartida;
            tipoPartida.tipoPartida = tipoPartidaNode.value;
          } else {
            console.error("Datos de tipoPartidaHost inválidos:", data);
          }
        });
      }

      socket.on("update-users", (members) => {
        players.value = members;
      });

      socket.on("game-started", () => {
        const modo = tipoPartida.tipoPartida.modo;
        if (modo === "numero") {
          router.push("/Online/PartidaNumeroOnline");
        } else if (modo === "crono") {
          router.push("/Online/PartidaCronoOnline");
        } else if (modo === "fallos") {
          router.push("/Online/PartidaFallosOnline");
        } else {
          console.error("Modo de partida no definido:", modo);
        }
      });
    });

    const hostEmpiezaPartida = () => {
      const modo = tipoPartida.tipoPartida.modo;
      socket.emit("start-game", {
        roomCode: codigoSala.value,
        modo: modo,
      });

      socket.on("game-started", () => {
        console.log("La partida ha comenzado correctamente.");
      });
    };

    onUnmounted(() => {
      socket.disconnect();
    });

    return {
      codigoSala,
      players,
      empezarPartidaBtn,
      hostEmpiezaPartida,
    };
  },
};
</script>

<style scoped>
.container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding: 2rem;
  gap: 2rem;
  width: 100%;
  max-width: 800px;
  margin: auto;
}

.card {
  width: 100%;
  max-width: 600px;
  background: #f5f5f7;
  border-radius: 12px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  overflow: hidden;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.card:hover {
  transform: translateY(-5px);
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
}

.card-header {
  background: #4a90e2;
  color: white;
  padding: 1rem;
  font-size: 1.5rem;
  font-weight: bold;
  text-align: center;
}

.card-body {
  padding: 1.5rem;
  text-align: center;
}

.code-display {
  font-size: 2rem;
  font-weight: bold;
  color: #4a90e2;
  background: #eef3fa;
  padding: 0.8rem 2rem;
  border-radius: 8px;
  margin: 1rem auto;
  display: inline-block;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.players-list {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.5rem;
}

.player-item {
  display: flex;
  align-items: center;
  gap: 1rem;
  font-size: 1rem;
  font-weight: 500;
  color: #4a4a4a;
  background: #eef3fa;
  padding: 0.8rem 1.5rem;
  border-radius: 8px;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
  width: 80%;
}

.profile-pic {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  object-fit: cover;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.start-btn {
  font-size: 1.2rem;
  font-weight: bold;
  padding: 0.8rem 2rem;
  border-radius: 8px;
  background: linear-gradient(90deg, #4a90e2, #007aff);
  color: white;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  transition: background 0.3s ease, transform 0.3s ease;
}

.start-btn:hover {
  background: linear-gradient(90deg, #007aff, #4a90e2);
  transform: translateY(-2px);
}

@media (max-width: 768px) {
  .card {
    padding: 1rem;
  }

  .card-header {
    font-size: 1.2rem;
  }

  .card-body {
    padding: 1rem;
  }

  .start-btn {
    font-size: 1rem;
    padding: 0.5rem 1.5rem;
  }
}
</style>
