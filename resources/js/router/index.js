import Vue from 'vue';
import VueRouter from 'vue-router';
import routes from "./router";
import {hasAuthentication, hasRoutePermission} from './permissionCheck'

Vue.use(VueRouter);

const router = new VueRouter({
    mode: 'history',
    routes
});

router.beforeEach((to, from, next) => {

    if( hasAuthentication(to, from) ){

        next({ name: 'login' })

    }else if( !hasRoutePermission(to, from) ){

        Vue.$toast.error("Sorry you don't have permission for this Page.");

        next(false)
    }

    else next()

});


export default router;
