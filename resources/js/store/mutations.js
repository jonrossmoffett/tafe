
import * as TYPES from './Types'

export default {

    [TYPES.SET_USER](state, user) {
        state.user = user;
    },
    [TYPES.CLEAR_USER](state, data) {
        state.user = null;
    },
    [TYPES.SET_LOADING](state, loading) {
        state.loading = loading;
    },
    [TYPES.SET_TOKEN](state, token) {
        state.token = token;
    },
    [TYPES.CLEAR_TOKEN](state) {
        state.token = null;
    },
}
