<template>
    <div class="container">
      <div class="card">
        <div class="card-header">
          <h3>¡Comparte tu código!</h3>
        </div>
        <div class="card-body">
          <div class="code-display">{{ gameCode }}</div>
          <p>Invita a tus amigos para unirse a la partida.</p>
        </div>
      </div>
  
      <div class="card">
        <div class="card-header">
          <h3>Jugadores en la partida</h3>
        </div>
        <div class="card-body players-list">
          <div v-for="player in players" :key="player" class="player-item">
            {{ player }}
          </div>
        </div>
      </div>
  
      <q-btn 
        class="start-btn"
        label="Comenzar partida"
        color="primary"
        @click="irPartida"
      />
    </div>
  </template>
  
  <script>
  import { useRouter } from 'vue-router'
  export default {
    setup(){
        const router = useRouter();
        function irPartida(){
            router.push('/Online/PartidaNumero');
        }

        return{
            irPartida,
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
    font-size: 1rem;
    font-weight: 500;
    color: #4a4a4a;
    background: #eef3fa;
    padding: 0.8rem 1.5rem;
    border-radius: 8px;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
    width: 80%;
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
  