
import axios from "axios";
import { store } from '../store/index';

export const apiClient = axios.create({
    baseURL: process.env.MIX_API_URL+'/api' || "http://localhost:8000/api",
});

apiClient.interceptors.request.use((config) => {

    config.headers = { "Accept": 'application/json' };
    config.headers = { "Content-Type": 'application/json' };

    let token = store.getters.token;

    if(token) config.headers = { "Authorization": 'Bearer '+token };

    return config;
});
