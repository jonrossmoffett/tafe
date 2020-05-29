import logout from '../components/logout';
import AdminViewUser from "../components/AdminViewUser";
import Login from "../pages/auth/Login";
import Enquiry from "../pages/enquiry/Enquiry";
import EnquiryIndex from "../pages/enquiry/EnquiryIndex";
import EnquiryCreate from "../pages/enquiry/EnquiryCreate";
import ResetPassword from "../pages/auth/ResetPassword";
import ForgotPassword from "../pages/auth/ForgotPassword";
import mobile from "../pages/auth/mobile";
import mobileCreate from "../pages/auth/mobileCreate";
import mobiledit from "../pages/auth/mobileEdit";

export default [{
        path: '/',
        name: 'home',
        component: EnquiryIndex,
        meta: { requiresAuth: true, title: 'Welcome' }
    },
    {
        path: '/admin/user',
        name: 'admin.user',
        component: AdminViewUser,
        meta: { requiresAuth: true, title: 'View User' }
    },
    {
        path: "/enquiry",
        component: Enquiry,
        children: [{
                path: '',
                name: 'enquiry',
                component: EnquiryIndex,
                meta: { requiresAuth: true, title: 'Enquiry List' }
            },
            {
                path: 'create',
                name: 'enquiry.create',
                component: EnquiryCreate,
                meta: { requiresAuth: true, title: 'Create Enquiry' }
            },
        ]
    },
    {
        path: '/login',
        name: 'login',
        component: Login,
        meta: { title: 'login' }
    },
    {
        path: '/logout',
        name: 'logout',
        component: logout,
        meta: { requiresAuth: true }
    },
    {
        path: '/forgot-password',
        name: 'forgot.password',
        component: ForgotPassword,
    },
    {
        path: '/reset-password',
        name: 'reset.password',
        component: ResetPassword,
        props: (route) => ({ query: route.query })
    },
    {
        path: '/mobile',
        name: 'mobile',
        component: mobile,
    },
    {
        path: '/mobilecreate',
        name: 'mobilecreate',
        component: mobileCreate,
    },
    {
        path: '/mobiledit',
        name: 'mobiledit',
        component: mobiledit,
    }
];