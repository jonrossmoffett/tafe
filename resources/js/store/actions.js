
import * as TYPES from './Types'

export default {
    USER_LOGGED_IN({ commit }, data) {
        commit(TYPES.SET_USER, data);
    },

    USER_LOGGED_OUT({commit}) {
        commit(TYPES.CLEAR_USER, {});
        commit(TYPES.CLEAR_TOKEN);
    },

    SET_LOADING({ commit }, data) {
        commit(TYPES.SET_LOADING, data);
    },

    SET_TOKEN({ commit }, token) {
        commit(TYPES.SET_TOKEN, token);
    },
}
