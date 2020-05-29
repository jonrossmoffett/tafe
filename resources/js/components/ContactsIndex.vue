<template>
    <div v-if="loading">loading</div>
    <div v-else>
        <div v-if="contacts.length === 0">
            <div class="w-full lg:static lg:max-h-full lg:overflow-visible lg:w-3/4 xl:w-4/5 "></div>
            <div class="flex">
                <div class="markdown px-6 xl:px-12 w-full align-content-center mx-auto lg:ml-0 lg:mr-auto xl:mx-0 xl:w-3/4">

                    <div class="flex items-center bg-blue-500 text-white text-sm font-bold px-4 py-3" role="alert">
                        <svg class="fill-current w-4 h-4 mr-2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M12.432 0c1.34 0 2.01.912 2.01 1.957 0 1.305-1.164 2.512-2.679 2.512-1.269 0-2.009-.75-1.974-1.99C9.789 1.436 10.67 0 12.432 0zM8.309 20c-1.058 0-1.833-.652-1.093-3.524l1.214-5.092c.211-.814.246-1.141 0-1.141-.317 0-1.689.562-2.502 1.117l-.528-.88c2.572-2.186 5.531-3.467 6.801-3.467 1.057 0 1.233 1.273.705 3.23l-1.391 5.352c-.246.945-.141 1.271.106 1.271.317 0 1.357-.392 2.379-1.207l.6.814C12.098 19.02 9.365 20 8.309 20z"/></svg>
                        <p>No Contacts Found</p>
                    </div>

                </div>
                <router-link class="float-right bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" to="/contact/create">Add New Contact</router-link>

            </div>


        </div>
        <div v-for="contact in contacts" :key="contact.data.name">
            <router-link
                :to="/contacts/ + contact.data.contact_id"
                class="flex items-center border-b border-gray-400 p-4 hover:bg-gray-100" >
                <UserProfile :name="contact.data.name"></UserProfile>
                <div class="pl-4">
                    <p class="text-blue-400 font-bold">{{contact.data.name}}</p>
                    <p class="text-gray-600">{{contact.data.company}}</p>
                </div>
            </router-link>
        </div>
    </div>
</template>

<script>
    import UserProfile from "./UserProfile";

    export default {
        name: "ContactsIndex",
        components: {UserProfile},
        data: function () {
            return {
                loading: true,
                contacts: ""
            };
        },

        mounted() {
            this.getContacts();
        },

        methods: {
            getContacts() {
                this.loading = true;
                axios
                    .get("/contacts")
                    .then(({data}) => {
                        this.contacts = data.data;
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

<style scoped>
</style>
