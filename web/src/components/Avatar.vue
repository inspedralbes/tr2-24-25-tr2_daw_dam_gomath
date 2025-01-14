<template>
    <q-avatar>
      <img :src="avatarUrl" alt="Avatar" />
    </q-avatar>
  </template>
  
  <script>
  export default {
    props: {
      initialUserId: {
        type: String,
        required: true,
      },
    },
    computed: {
      avatarUrl() {
        return `https://api.multiavatar.com/${this.initialUserId}.png`;
      },
    },
  };
  </script>
  
  <style scoped>
  .q-avatar img {
    border-radius: 50%;
  }
  </style>
  