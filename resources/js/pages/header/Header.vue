<template>
    <div class="h-16 px-6 border-b border-gray-400 flex items-center justify-between">
        <div>{{ title }}</div>

        <div class="flex items-center">
            <searchBar></searchBar>
            <UserProfile :name="user.name"/>
        </div>
    </div>
</template>

<script>
    import UserProfile from "../../components/UserProfile";
    import searchBar from "../../components/searchBar";


    export default {
        name: "Header",
        props: ['title'],
        components: {
            UserProfile,
            searchBar
        },

        created() {
            this.title = this.$route.meta.title;
        },

        computed: {
            user(){
                return this.$store.getters.user;
            }
        },

    }
</script>

<style scoped>

</style>
