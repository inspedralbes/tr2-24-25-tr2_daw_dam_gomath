import { defineStore } from 'pinia';

export const useAppStore = defineStore('app', {
  state: () => ({
    loginInfo: {
      loggedIn: false,
      token: '',
      username: '',
      email: '',
      role: '',
      image: '',
    },
    registrationInfo: {
      loggedIn: false,
      token: '',
      username: '',
      email: '',
      role: '',
      image: '',
    },
  }),

  actions: {
    // Acción para realizar logout y resetear los datos del login
    logout() {
      this.loginInfo.loggedIn = false;
      this.loginInfo.token = '';
      this.loginInfo.username = '';
      this.loginInfo.email = '';
      this.loginInfo.role = '';
      this.loginInfo.image = '';
    },

    // Acción para establecer la información de login
    setLoginInfo({ loggedIn, token, username, email, role, image }) {
      this.loginInfo.loggedIn = loggedIn;
      this.loginInfo.token = token;
      this.loginInfo.username = username;
      this.loginInfo.email = email;
      this.loginInfo.role = role;
      this.loginInfo.image = image;
    },

    // Acción para establecer la información de registro (puede ser utilizada en otros casos)
    setRegistrationInfo({ loggedIn, token, username, role, image }) {
      this.registrationInfo.loggedIn = loggedIn;
      this.token = token;
      this.registrationInfo.username = username;
      this.registrationInfo.role = role;
      this.registrationInfo.image = image;
    },
  },

  getters: {
    isLoggedIn: (state) => state.loginInfo.loggedIn,

    getLoginInfo: (state) => state.loginInfo,

    getRegistrationInfo: (state) => state.registrationInfo,
  },
});
