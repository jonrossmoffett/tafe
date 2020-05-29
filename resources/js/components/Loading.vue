<template>
    <div class="w-full h-full fixed block top-0 left-0 bg-white opacity-75 z-50">
              <span id="loading" class=" opacity-75 top-1/2 my-0 mx-auto block relative w-0 h-0" style="top: 50%;">
                  <svg version="1.1" id="loader-1" xmlns="http://www.w3.org/2000/svg"
                       xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="100px" height="100px"
                       viewBox="0 0 50 50" xml:space="preserve">
                      <path fill="#000"
                            d="M43.935,25.145c0-10.318-8.364-18.683-18.683-18.683c-10.318,0-18.683,8.365-18.683,18.683h4.068c0-8.071,6.543-14.615,14.615-14.615c8.072,0,14.615,6.543,14.615,14.615H43.935z"
                            transform="rotate(307.097 25 25)">
                          <animateTransform attributeType="xml" attributeName="transform" type="rotate" from="0 25 25" to="360 25 25" dur="0.6s" repeatCount="indefinite"></animateTransform>
                      </path>
                  </svg>
              </span>
    </div>
</template>

<script>
    export default {
        name: "Loading"
    }
</script>

<style scoped>

</style>
