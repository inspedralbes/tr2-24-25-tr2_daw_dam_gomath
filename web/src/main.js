import './assets/main.css'

import { Quasar } from 'quasar'

// Import icon libraries
import '@quasar/extras/roboto-font/roboto-font.css'
import '@quasar/extras/material-icons/material-icons.css'
import '@quasar/extras/fontawesome-v6/fontawesome-v6.css'
import '@quasar/extras/themify/themify.css'

// Import Quasar css
import 'quasar/src/css/index.sass'

import { createApp } from 'vue'
import { createPinia } from 'pinia'

import App from './App.vue'
import router from './router'

const app = createApp(App)

app.use(createPinia())
app.use(router)

app.use(Quasar, {
    plugins: {}, // import Quasar plugins and add here
})

app.mount('#app')






