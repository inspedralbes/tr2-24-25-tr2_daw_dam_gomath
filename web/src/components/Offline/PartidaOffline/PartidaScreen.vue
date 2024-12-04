<template>
  <div class="q-pa-md botones-container">
    <q-btn-dropdown color="primary" label="NUMERO DE PREGUNTAS">
      <q-list>
        <q-item clickable v-close-popup @click="onItemClick">
          <q-item-section>
            <q-item-label>10</q-item-label>
          </q-item-section>
        </q-item>

        <q-item clickable v-close-popup @click="onItemClick">
          <q-item-section>
            <q-item-label>20</q-item-label>
          </q-item-section>
        </q-item>

        <q-item clickable v-close-popup @click="onItemClick">
          <q-item-section>
            <q-item-label>30</q-item-label>
          </q-item-section>
        </q-item>
      </q-list>
    </q-btn-dropdown>

    <q-btn-dropdown color="primary" label="CRONO">
      <q-list>
        <q-item clickable v-close-popup @click="onItemClick">
          <q-item-section>
            <q-item-label>30seg</q-item-label>
          </q-item-section>
        </q-item>

        <q-item clickable v-close-popup @click="onItemClick">
          <q-item-section>
            <q-item-label>1min</q-item-label>
          </q-item-section>
        </q-item>

        <q-item clickable v-close-popup @click="onItemClick">
          <q-item-section>
            <q-item-label>3min</q-item-label>
          </q-item-section>
        </q-item>
      </q-list>
    </q-btn-dropdown>

    <q-btn-dropdown color="primary" label="HASTA QUE FALLES">
      <q-list>
        <q-item clickable v-close-popup @click="onItemClick">
          <q-item-section>
            <q-item-label>1 Fallo</q-item-label>
          </q-item-section>
        </q-item>

        <q-item clickable v-close-popup @click="onItemClick">
          <q-item-section>
            <q-item-label>3 Fallos</q-item-label>
          </q-item-section>
        </q-item>

        <q-item clickable v-close-popup @click="onItemClick">
          <q-item-section>
            <q-item-label>5 Fallos</q-item-label>
          </q-item-section>
        </q-item>
      </q-list>
    </q-btn-dropdown>
  </div>
</template>

<script>
export default {
  setup () {
    return {
      onItemClick () {
        // console.log('Clicked on an Item')
      }
    }
  }
}
</script>

<style scoped>
.botones-container {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 20px; 
}

.q-btn-dropdown {
  font-size: 16px;
  padding: 10px 20px;
  height: 50px; 
}


.q-item-label {
  font-weight: bold;
}
</style>
