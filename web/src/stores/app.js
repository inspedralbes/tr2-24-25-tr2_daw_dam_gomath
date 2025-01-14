import { defineStore } from 'pinia';

export const useAppStore = defineStore('app', {
  state: () => ({
    loginInfo: {
      loggedIn: false,
      token: '',
      username: '',
      email: '',
      role: '',
      image: localStorage.getItem('avatarUrl') || '',
    },
    registrationInfo: {
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
      this.loginInfo.loggedIn = false;
      this.loginInfo.token = '';
      this.loginInfo.username = '';
      this.loginInfo.email = '';
      this.loginInfo.role = '';
      this.loginInfo.image = '';
      localStorage.removeItem('avatarUrl');
    },

    setLoginInfo({ loggedIn, token, username, email, role, image }) {
      this.loginInfo.loggedIn = loggedIn;
      this.loginInfo.token = token;
      this.loginInfo.username = username;
      this.loginInfo.email = email;
      this.loginInfo.role = role;
      this.loginInfo.image = image;

      localStorage.setItem('avatarUrl', image);
    },
    
    setRegistrationInfo({ loggedIn, token, username, role, image }) {
      this.registrationInfo.loggedIn = loggedIn;
      this.registrationInfo.token = token;
      this.registrationInfo.username = username;
      this.registrationInfo.role = role;
      this.registrationInfo.image = image;

      localStorage.setItem('avatarUrl', image);
    },
  },

  getters: {
    isLoggedIn: (state) => state.loginInfo.loggedIn,
    getLoginInfo: (state) => state.loginInfo,
    getRegistrationInfo: (state) => state.registrationInfo,
  },
});
