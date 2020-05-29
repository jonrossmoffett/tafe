<template>
    <div>
        <template v-if="isAuthenticated">
            <div class="h-screen bg-white">
                <div class="flex">
                    <Sidebar></Sidebar>
                    <div class="flex-1 flex flex-col h-screen overflow-y-hidden">
                        <Header :title="title"></Header>
                        <div class="flex flex-col overflow-y-hidden flex-1">
                            <router-view class="overflow-x-hidden p-6"></router-view>
                        </div>
                    </div>
                </div>
            </div>
        </template>
        <template v-else>
            <div class="h-screen bg-white">
                <router-view></router-view>
            </div>
        </template>
    </div>
</template>

<script>
    import Header from "../pages/header/Header";
    import Sidebar from "../pages/header/Sidebar";

    export default {
        name: "App",
        components: {
            Sidebar,
            Header
        },
        created() {
            this.title = this.$route.meta.title;
        },
        data: function () {
            return {
                title: "",
                admin: "false",
            };
        },

        computed : {

            isAuthenticated() {
                return (this.$store.state.user !== null);
            }
        },
        watch: {
            $route(to, from) {
                this.title = to.meta.title;
            },
            title() {
                document.title = this.title + " | Aquarama";
            },
        }
    };
</script>
