export default {
    user: state => state.user,
    loading: state => state.loading,
    token: state => state.token,
    isAuthenticated: state => state.user !== null,
    isAdmin: state => state.user.isAdmin === true,

}
