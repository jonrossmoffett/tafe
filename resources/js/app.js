
import Vue from 'vue';
import router from './router/index';
import App from './components/App';
import { store } from './store/index';
import VueToast from 'vue-toast-notification';
import VuejsDialog from 'vuejs-dialog';

import './utils/filter';
import 'vue-toast-notification/dist/theme-default.css';
import 'vuejs-dialog/dist/vuejs-dialog.min.css';

require('./bootstrap');

Vue.use(VueToast, {
    position: 'top-right',
    duration: 3000,
});
Vue.use(VuejsDialog);

axios.defaults.baseURL = process.env.MIX_API_URL+'/api' || "http://localhost:8000/api";
let token = store.getters.token;
if(token) axios.defaults.headers.common['Authorization'] = 'Bearer '+token;


Vue.config.devtools = true;

const app = new Vue({
    el: '#app',
    components: {
        App
    },
    router,
    store,
});
