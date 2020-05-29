<template></template>
<script>
export default {
  mounted() {
    axios.get("/logout").then(response => {
      this.$store.dispatch("USER_LOGGED_OUT");

      this.$router.push("/login");
    });
  }
};
</script>
