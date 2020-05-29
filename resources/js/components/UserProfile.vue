<template>
  <div>
    <div
      class="rounded-full text-white bg-blue-400 w-10 h-10 flex justify-center items-center border border-gray-400"
    >{{UserProfile}}</div>
  </div>
</template>


<script>
export default {
  name: "UserProfile",
  props: ["name"],
  computed: {
    UserProfile: function() {
      return this.name.slice(0, 1);
    }
  }
};
</script>