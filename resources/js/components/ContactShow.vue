<template>
  <div>
    <div class>
      <div v-if="loading">loading...</div>
      <div v-else>
        <div class="flex justify-between">
          <a href="#" class="text-blue-600" @click="$router.back()">back</a>
          <div class="flex relative">
            <router-link
              :to="'/contacts/' + contact.contact_id + '/edit'"
              class="px-4 py-2 rounded text-sm text-green-500 border border-green-500 font-bold mr-2"
            >edit</router-link>
            <a
              href="#"
              class="px-4 py-2 rounded text-sm text-red-500 border border-red-500 font-bold"
              @click="modal = ! modal"
            >Delete</a>
            <div
              v-if="modal"
              class="absolute bg-blue-900 text-white rounded-lg z-20 p-8 w-64 right-0 mt-12 mr-6"
            >
              <p>are you sure you want to delete this contact</p>
              <div class="flex items-center mt-6 justify-end">
                <button @click=" modal = ! modal" class="text-white pr-4">Cancel</button>
                <button
                  @click="destroy"
                  class="px-4 py-2 bg-red-500 rounded text-sm font-bold text-white"
                >Delete</button>
              </div>
            </div>
          </div>
          <div
            v-if="modal"
            @click=" modal = ! modal"
            class="bg-black opacity-25 absolute right-0 left-0 bottom-0 top-0 z-10"
          ></div>
        </div>

        <div class="flex items-center pt-6">
          <UserProfile :name="contact.name" />
          <p class="pl-5 text-xl">{{contact.name}}</p>
        </div>
        <p class="pt-6 text-gray-600 font-bold uppercase text-sm">Contact</p>
        <p class="pt-2 text-blue-400">{{contact.email}}</p>
        <p class="pt-6 text-gray-600 font-bold uppercase text-sm">Company</p>
        <p class="pt-2 text-blue-400">{{contact.company}}</p>
        <p class="pt-6 text-gray-600 font-bold uppercase text-sm">Birthday</p>
        <p class="pt-2 text-blue-400">{{contact.birthday}}</p>
      </div>
    </div>
  </div>
</template>

<script>
import UserProfile from "./UserProfile";
import Admin from "./Admin";
export default {
  name: "ContactShow",
  components: {
    UserProfile,
    Admin
  },

  mounted() {
    axios
      .get("/api/contacts/" + this.$route.params.id)
      .then(response => {
        this.contact = response.data.data;
        this.loading = false;
      })
      .catch(error => {
        this.loading = false;

        if (error.response.status === 404) {
          this.$router.push("/contacts");
        }
      });
  },

  data: function() {
    return {
      loading: true,
      modal: false,
      contact: null
    };
  },
  methods: {
    destroy: function() {
      axios
        .delete("/api/contacts/" + this.$route.params.id)
        .then(response => {
          this.$router.push("/contacts");
        })
        .catch(error => {});
    }
  }
};
</script>