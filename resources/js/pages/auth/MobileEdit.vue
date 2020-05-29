
  
<template>
  <div class="flex h-full w-full flex-col m-0 p-0 bg-grey-300 justify-center content-center">
    <div class="w-full max-w-l h-full">
      <div class="h-32 flex items-center justify-center w-full mt-4">
        <img
          class="h-32 w-32 border-2 border-gray-600 rounded-full object-cover"
          src="https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=256&q=80"
          alt="Your avatar"
        />
      </div>

      <div class="w-full flex items-center justify-center mt-4">
        <h1 class="font-bold text-sm text-blue-900">Jane Doe</h1>
      </div>

      <form class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4 h-full">
        <div class="mb-4">
          <label class="block text-gray-700 text-sm font-bold mb-2" for="username">Name</label>
          <input
            class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
            id="username"
            type="text"
            placeholder="Title"
          />
        </div>

        <div class="mb-4">
          <label class="block text-gray-700 text-sm font-bold mb-2" for="username">Email</label>
          <input
            class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
            id="username"
            type="text"
            placeholder="Title"
          />
        </div>

        <div class="mb-4">
          <label class="block text-gray-700 text-sm font-bold mb-2" for="username">Phone</label>
          <input
            class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
            id="username"
            type="text"
            placeholder="Title"
          />
        </div>

        <button
          class="bg-blue-900 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline w-full"
          type="button"
        >Change Password</button>

        <div class="flex items-center justify-between mt-6 absolute left-0 bottom-0 mb-6 ml-6">
          <button
            class="bg-blue-900 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
            type="button"
          >Submit</button>
          <a
            class="inline-block align-baseline font-bold text-sm text-blue-900 hover:text-blue-800 ml-6"
            href="/mobile"
          >Back</a>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import AccountDropdown from "./AccountDropdown";
export default {
  components: {
    AccountDropdown
  },
  data() {
    return {
      isOpen: false
    };
  }
};
</script>

