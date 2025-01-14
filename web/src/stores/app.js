import { defineStore } from 'pinia';

export const useAppStore = defineStore('app', {
  state: () => ({
    loginInfo: JSON.parse(localStorage.getItem('loginInfo')) || {
      loggedIn: false,
      token: '',
      username: '',
      email: '',
      role: '',
      image: localStorage.getItem('avatarUrl') || '',
    },
    registrationInfo: JSON.parse(localStorage.getItem('registrationInfo')) || {
      loggedIn: false,
      token: '',
      username: '',
      email: '',
      role: '',
      image: localStorage.getItem('avatarUrl') || '',
    },
  }),

  actions: {
    logout() {
      this.loginInfo = {
        loggedIn: false,
        token: '',
        username: '',
        email: '',
        role: '',
        image: '',
      };
      localStorage.setItem('loginInfo', JSON.stringify(this.loginInfo));
    },

    setLoginInfo({ loggedIn, token, username, email, role, image }) {
      this.loginInfo = { loggedIn, token, username, email, role, image };
      localStorage.setItem('loginInfo', JSON.stringify(this.loginInfo));
    },

    setRegistrationInfo({ loggedIn, token, username, email, role, image }) {
      this.registrationInfo = { loggedIn, token, username, email, role, image };
      localStorage.setItem('registrationInfo', JSON.stringify(this.registrationInfo));
    },
  },

  getters: {
    isLoggedIn: (state) => state.loginInfo.loggedIn,
    getLoginInfo: (state) => state.loginInfo,
    getRegistrationInfo: (state) => state.registrationInfo,
  },
});
