import Vue from 'vue'
import Vuex from 'vuex'
import mutations from './mutations'
import actions from './actions'
import getters from './getters'
import VuexPersistence from "vuex-persist";
Vue.use(Vuex);

const vuexLocal = new VuexPersistence({
    storage: window.localStorage
});

export const store = new Vuex.Store({
    state : {
        user : null,
        loading: false,
        token: null,
    },
    mutations,
    actions,
    getters,
    plugins: [vuexLocal.plugin]
});
