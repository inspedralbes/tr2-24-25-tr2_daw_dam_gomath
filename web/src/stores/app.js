
import { defineStore } from 'pinia';
import { ref, computed } from 'vue';

export const useAppStore = defineStore('app', () => {

  const loginInfo = ref({
    loggedIn: false,
    username: '',
    role: '',
    image: '',
  });

  const registrationInfo = ref({
    loggedIn: false,
    username: '',
    role: '',
    image: '',
  });
  
  const setLoginInfo = ({ loggedIn, username, role, image }) => {
    loginInfo.value.loggedIn = loggedIn;
    loginInfo.value.username = username;
    loginInfo.value.role = role;
    loginInfo.value.image = image;
  };

  const setRegistrationInfo = ({ loggedIn, username, role, image }) => {
    registrationInfo.value.loggedIn = loggedIn;
    registrationInfo.value.username = username;
    registrationInfo.value.role = role;
    registrationInfo.value.image = image;
  };

  const isLoggedIn = computed(() => loginInfo.value.loggedIn);
  const getLoginInfo = computed(() => loginInfo.value);


  return {
    loginInfo,
    registrationInfo,
    setLoginInfo,
    setRegistrationInfo,
    isLoggedIn,
    getLoginInfo,
  };

});
