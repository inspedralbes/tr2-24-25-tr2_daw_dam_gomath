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
      imageId: '',
    },
    registrationInfo: JSON.parse(localStorage.getItem('registrationInfo')) || {
      loggedIn: false,
      token: '',
      username: '',
      email: '',
      role: '',
      image: localStorage.getItem('avatarUrl') || '',
      imageId: '',
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
        imageId: ''
      };
      localStorage.setItem('loginInfo', JSON.stringify(this.loginInfo));
    },

    setLoginInfo({ loggedIn, token, username, email, role, image, imageId }) {
      this.loginInfo = { loggedIn, token, username, email, role, image, imageId };
      localStorage.setItem('loginInfo', JSON.stringify(this.loginInfo));
    },

    setRegistrationInfo({ loggedIn, token, username, email, role, image, imageId }) {
      this.registrationInfo = { loggedIn, token, username, email, role, image, imageId };
      localStorage.setItem('registrationInfo', JSON.stringify(this.registrationInfo));
    },
  },

  getters: {
    isLoggedIn: (state) => state.loginInfo.loggedIn,
    getLoginInfo: (state) => state.loginInfo,
    getRegistrationInfo: (state) => state.registrationInfo,
  },
});
