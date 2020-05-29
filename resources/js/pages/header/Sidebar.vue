<template>
    <div class="bg-gray-200 w-48 h-screen border-r-2 border-gray-400">
        <nav class="pt-4 pl-4">
            <router-link to="/">

            </router-link>

            <div v-for="menus in menuItems">

                <p class="text-gray-500 uppercase font-bold text-sm pt-12">{{ Object.keys(menus).join(' ') }}</p>
                <div v-for="menu in menus">
                    <router-link v-for="(item, index) in menu" :key="index" class="flex items-center py-2 text-sm" :to="{name: item.route}">
                        <svg viewBox="0 0 24 24" class="fill-current text-blue-600 w-5 h-5">
                            <path
                                d="M23.3 11.9c0 .9-.6 1.4-1.4 1.4h-8.5v8.5c0 .9-.6 1.4-1.4 1.4s-1.4-.6-1.4-1.4v-8.5H2c-.9 0-1.4-.6-1.4-1.4 0-.9.6-1.4 1.4-1.4h8.5V1.9c0-.9.6-1.4 1.4-1.4s1.4.6 1.4 1.4v8.5h8.5c.9 0 1.5.6 1.5 1.5z"
                            />
                        </svg>
                        <div class="pl-2 tracking-wide hover:text-blue-600">{{ item.title }}</div>
                    </router-link>
                </div>


            </div>

<!--            <p class="text-gray-500 uppercase font-bold text-sm pt-12">Admin</p>-->

<!--            <router-link class="flex items-center py-2 text-sm" to="/admin/user">-->
<!--                <svg viewBox="0 0 24 24" class="fill-current text-blue-600 w-5 h-5">-->
<!--                    <path-->
<!--                        d="M23.3 11.9c0 .9-.6 1.4-1.4 1.4h-8.5v8.5c0 .9-.6 1.4-1.4 1.4s-1.4-.6-1.4-1.4v-8.5H2c-.9 0-1.4-.6-1.4-1.4 0-.9.6-1.4 1.4-1.4h8.5V1.9c0-.9.6-1.4 1.4-1.4s1.4.6 1.4 1.4v8.5h8.5c.9 0 1.5.6 1.5 1.5z"-->
<!--                    />-->
<!--                </svg>-->
<!--                <div class="pl-2 tracking-wide hover:text-blue-600">view users</div>-->
<!--            </router-link>-->

<!--            <p class="text-gray-500 uppercase font-bold text-sm pt-12">Create</p>-->

<!--            <router-link class="flex items-center py-2 text-sm" to="/contacts/create">-->
<!--                <svg viewBox="0 0 24 24" class="fill-current text-blue-600 w-5 h-5">-->
<!--                    <path-->
<!--                        d="M23.3 11.9c0 .9-.6 1.4-1.4 1.4h-8.5v8.5c0 .9-.6 1.4-1.4 1.4s-1.4-.6-1.4-1.4v-8.5H2c-.9 0-1.4-.6-1.4-1.4 0-.9.6-1.4 1.4-1.4h8.5V1.9c0-.9.6-1.4 1.4-1.4s1.4.6 1.4 1.4v8.5h8.5c.9 0 1.5.6 1.5 1.5z"-->
<!--                    />-->
<!--                </svg>-->
<!--                <div class="pl-2 tracking-wide hover:text-blue-600">Add new</div>-->
<!--            </router-link>-->

<!--            <p class="text-gray-500 uppercase font-bold text-sm pt-12">General</p>-->

<!--            <router-link class="flex items-center py-2 text-sm" to="/contacts">-->
<!--                <svg viewBox="0 0 24 24" class="fill-current text-blue-600 w-5 h-5">-->
<!--                    <path-->
<!--                        d="M23.3 11.9c0 .9-.6 1.4-1.4 1.4h-8.5v8.5c0 .9-.6 1.4-1.4 1.4s-1.4-.6-1.4-1.4v-8.5H2c-.9 0-1.4-.6-1.4-1.4 0-.9.6-1.4 1.4-1.4h8.5V1.9c0-.9.6-1.4 1.4-1.4s1.4.6 1.4 1.4v8.5h8.5c.9 0 1.5.6 1.5 1.5z"-->
<!--                    />-->
<!--                </svg>-->
<!--                <div class="pl-2 tracking-wide hover:text-blue-600">Contacts</div>-->
<!--            </router-link>-->

<!--            <router-link class="flex items-center py-2 text-sm" to="/">-->
<!--                <svg viewBox="0 0 24 24" class="fill-current text-blue-600 w-5 h-5">-->
<!--                    <path-->
<!--                        d="M23.3 11.9c0 .9-.6 1.4-1.4 1.4h-8.5v8.5c0 .9-.6 1.4-1.4 1.4s-1.4-.6-1.4-1.4v-8.5H2c-.9 0-1.4-.6-1.4-1.4 0-.9.6-1.4 1.4-1.4h8.5V1.9c0-.9.6-1.4 1.4-1.4s1.4.6 1.4 1.4v8.5h8.5c.9 0 1.5.6 1.5 1.5z"-->
<!--                    />-->
<!--                </svg>-->
<!--                <div class="pl-2 tracking-wide hover:text-blue-600">Birthdays</div>-->
<!--            </router-link>-->

<!--            <p class="text-gray-500 uppercase font-bold text-sm pt-12">Settings</p>-->

<!--            <router-link class="flex items-center py-2 text-sm" to="/logout">-->
<!--                <svg viewBox="0 0 24 24" class="fill-current text-blue-600 w-5 h-5">-->
<!--                    <path-->
<!--                        d="M23.3 11.9c0 .9-.6 1.4-1.4 1.4h-8.5v8.5c0 .9-.6 1.4-1.4 1.4s-1.4-.6-1.4-1.4v-8.5H2c-.9 0-1.4-.6-1.4-1.4 0-.9.6-1.4 1.4-1.4h8.5V1.9c0-.9.6-1.4 1.4-1.4s1.4.6 1.4 1.4v8.5h8.5c.9 0 1.5.6 1.5 1.5z"-->
<!--                    />-->
<!--                </svg>-->
<!--                <div class="pl-2 tracking-wide hover:text-blue-600">logout</div>-->
<!--            </router-link>-->
        </nav>
    </div>
</template>

<script>
    import {mapGetters} from "vuex";
    import menu from "../../config/menu";

    export default {
        name: "Sidebar",
        data() {
            return {
                menuItems: [],
            }
        },

        methods: {
            loadMenuItems() {

                this.menuItems = menu.user;

                if(this.isAdmin) this.menuItems = menu.admin;
            }
        },

        computed: {
            ...mapGetters(['isAdmin']),
        },

        beforeMount() {
            this.loadMenuItems();
        },
    }
</script>

<style scoped>

</style>
