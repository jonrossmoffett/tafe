<template>
    <div class="flex items-center border-b border-gray-400 p-4 hover:bg-gray-100">
        <UserProfile :name="user.name"></UserProfile>
        <div class="pl-4">
            <p class="text-teal-500 font-bold text-lg">{{user.name}} ( <span class="inline-block text-sm px-2 uppercase text-teal-500">{{user.role}} </span>) </p>
            <a :href="'mailto:' + user.email" class="text-teal-500">{{user.email}}</a>
        </div>
    </div>
</template>

<script>
    import UserProfile from "./UserProfile";

    export default {
        name: "Admin",
        components: {UserProfile},
        props: {
            user: {
                type: Object,
                default: {}
            },
        },

        data: function () {
            return {
                admin: false,
                toggleAdmin: false
            };
            admin = this.admin;
        },
        watch: {
            admin: function (val) {
                if (val == "true") {
                    this.toggleAdmin = true;
                }
                if (val == "false") {
                    window.location = "/";
                    this.toggleAdmin = false;
                }
            }
        },

        mounted() {
            // axios
            //   .get("/api/admin")
            //   .then(response => {
            //     this.admin = response.data;
            //   })
            //   .catch(error => {
            //     alert("error");
            //   });
        }
    };
</script>
