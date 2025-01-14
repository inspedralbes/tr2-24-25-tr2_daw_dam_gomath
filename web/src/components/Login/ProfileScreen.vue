<template>
  <q-page class="flex flex-center">
    <q-card class="q-pa-md" style="width: 300px;">
      <q-card-section>
        <div class="text-center">
          <!-- Avatar que depende del nombre del usuario -->
          <q-avatar size="80px" class="q-mb-md">
            <img :src="avatarUrl" alt="Profile Picture" />
          </q-avatar>
          <br>
          <!-- Botón para cambiar el nombre -->
          <q-btn dense flat label="Cambiar nombre" @click="toggleInput" class="q-mb-md"
            style="background-color: #B0AEAC;" />

          <div class="text-h6">
            <q-input v-if="isEditing" v-model="userName" label="Nuevo nombre" outlined dense class="q-mb-md" />
            <div v-else>{{ userName }}</div>
          </div>

          <div class="text-subtitle2">{{ user.email }}</div>
        </div>
      </q-card-section>

      <q-card-section>
        <q-list>
          <q-item>
            <q-item-section>Rol</q-item-section>
            <q-item-section side>{{ user.role }}</q-item-section>
          </q-item>
          <q-item>
            <q-item-section>Data de registre</q-item-section>
            <q-item-section side>{{ formattedDate }}</q-item-section>
          </q-item>
        </q-list>
      </q-card-section>

      <q-card-actions align="right">
        <!-- Botón para guardar los cambios -->
        <q-btn v-if="isEditing" label="Guardar" color="primary" @click="saveName" />
        <q-btn label="Tancar sessió" color="negative" @click="logout" />
      </q-card-actions>
    </q-card>
  </q-page>
</template>

<script>
import { ref, computed, reactive } from 'vue';
import { useAppStore } from '@/stores/app';
import { useRouter } from 'vue-router';

export default {
  name: 'ProfileScreen',
  setup() {
    const appStore = useAppStore();
    const router = useRouter();

    const user = reactive(appStore.loginInfo);
    const userName = ref(user.username);
    const isEditing = ref(false);

    const avatarName = computed(() => userName.value || 'default-user');
    const avatarUrl = computed(() => `https://api.multiavatar.com/${avatarName.value}.png`);

    const toggleInput = () => {
      isEditing.value = !isEditing.value;
    };

    const saveName = async () => {
      try {
        const avatarURL = avatarUrl.value; 
        await updateUserNameInBackend(userName.value);

        appStore.setLoginInfo({
          ...appStore.loginInfo,
          username: userName.value,
          image: avatarURL,
        });

        isEditing.value = false;
      } catch (error) {
        console.error('Error al guardar el nombre:', error);
      }
    };



    const updateUserNameInBackend = async (newName) => {
      try {
        console.log(appStore.loginInfo);

        console.log('hola', user.email);

        const token = appStore.loginInfo.token;
        if (!user.email) {
          throw new Error('El email del usuario no está definido');
        }

        const response = await fetch(`http://localhost:8000/api/user/update/${user.email}`, {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json',
            Authorization: `Bearer ${token}`,
          },
          body: JSON.stringify({ name: newName }),
        });

        if (!response.ok) {
          throw new Error('Error al actualizar el nombre');
        }

        const data = await response.json();
        console.log('Nombre actualizado correctamente:', data);
      } catch (error) {
        console.error('Error al actualizar el nombre:', error);
      }
    };


    const formattedDate = new Date().toLocaleDateString('ca-ES', {
      year: 'numeric',
      month: 'long',
      day: 'numeric',
    });

    const logout = async () => {
      try {
        const token = appStore.loginInfo.token;
        const response = await fetch('http://gomath.daw.inspedralbes.cat/public/api/userLogout', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            Authorization: `Bearer ${token}`,
          },
        });

        if (!response.ok) {
          throw new Error('Error al cerrar sesión');
        }

        appStore.logout();
        router.push('/login');
      } catch (error) {
        console.error('Error al cerrar sesión:', error);
      }
    };

    return {
      user,
      formattedDate,
      avatarUrl,
      userName,
      isEditing,
      toggleInput,
      saveName,
      logout,
    };
  },
};
</script>

<style scoped>
.text-center {
  text-align: center;
}
</style>
