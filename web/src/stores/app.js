import { defineStore } from 'pinia';

export const useAppStore = defineStore('app', {
  state: () => ({
    loginInfo: {
      loggedIn: false,
      username: '',
      role: '',
      image: '',
    },
    registrationInfo: {
      loggedIn: false,
      username: '',
      role: '',
      image: '',
    },
  }),
  actions: {
    logout() {
      this.loginInfo.loggedIn = false;
      this.loginInfo.username = '';
      this.loginInfo.role = '';
      this.loginInfo.image = '';
    },
    setLoginInfo({ loggedIn, username, role, image }) {
      this.loginInfo.loggedIn = loggedIn;
      this.loginInfo.username = username;
      this.loginInfo.role = role;
      this.loginInfo.image = image;
    },
    setRegistrationInfo({ loggedIn, username, role, image }) {
      this.registrationInfo.loggedIn = loggedIn;
      this.registrationInfo.username = username;
      this.registrationInfo.role = role;
      this.registrationInfo.image = image;
    },
  },
  getters: {
    isLoggedIn: (state) => state.loginInfo.loggedIn,
    getLoginInfo: (state) => state.loginInfo,
  },
});
