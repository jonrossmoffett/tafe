import {store} from '../store/index';
import routePermissions from "../config/routePermissions";

export function hasRoutePermission(to, from) {

    /* Common route like login logout password reset */
    if (routePermissions.general.indexOf(to.name) > -1) {

        return true;
    }

    let permissions = routePermissions.user;

    if (store.getters.isAuthenticated) {
        permissions = routePermissions.admin;
    }

    let hasPermission = permissions.indexOf(to.name);

    return hasPermission > -1;
}


export function hasAuthentication(to, from) {

    return to.name !== 'login' && to.meta.requiresAuth === true && !store.getters.isAuthenticated
}
