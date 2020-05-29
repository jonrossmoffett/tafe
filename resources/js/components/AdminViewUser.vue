<template>
    <div>
        <Admin :user="user" v-for="user in users" :key="users.id"></Admin>
    </div>
</template>

<script>
    import Admin from "./Admin";

    export default {
        name: "AdminViewUser",
        components: {
            Admin
        },
        data() {
            return {
                users: {},
                loading: false,
            }
        },
        mounted() {
            this.getAdminUser();
        },

        methods: {
            getAdminUser() {
                this.loading = true;

                axios
                    .get("/admin/users")
                    .then(({data}) => {
                        this.users = data.data;
                    })
                    .catch(error => {
                        if (error.response !== undefined && error.response.status === 422) {/* validation error */
                            this.errors = error.response.data.message;
                        }
                    })
                    .finally(() => {
                        this.loading = false;
                    });
            }
        }
    };
</script>
