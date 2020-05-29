
  
<template>
  <div class="flex h-full w-full flex-col m-0 p-0">
    <header class="bg-blue-900 sm:flex sm:justify-between sm:items-center m-0 p-0 w-full">
      <div class="flex items-center justify-between px-3 py-3 sm:p-0 h-16 w-full">
        <div>
          <div class="flex items-center">
            <img
              class="h-10 w-10 border-2 border-gray-600 rounded-full object-cover"
              src="https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=256&q=80"
              alt="Your avatar"
            />
            <span class="ml-3 font-semibold text-white">Jane Doe</span>
          </div>
        </div>
        <div class="sm:hidden">
          <button
            @click="isOpen = !isOpen"
            type="button"
            class="block text-gray-500 hover:text-white focus:text-white focus:outline-none"
          >
            <svg class="h-10 w-10 fill-current" viewBox="0 0 24 24">
              <path
                v-if="isOpen"
                fill-rule="evenodd"
                d="M18.278 16.864a1 1 0 0 1-1.414 1.414l-4.829-4.828-4.828 4.828a1 1 0 0 1-1.414-1.414l4.828-4.829-4.828-4.828a1 1 0 0 1 1.414-1.414l4.829 4.828 4.828-4.828a1 1 0 1 1 1.414 1.414l-4.828 4.829 4.828 4.828z"
              />
              <path
                v-if="!isOpen"
                fill-rule="evenodd"
                d="M4 5h16a1 1 0 0 1 0 2H4a1 1 0 1 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 0 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 0 1 0-2z"
              />
            </svg>
          </button>
        </div>
      </div>
      <nav :class="isOpen ? 'block' : 'hidden'" class="sm:block">
        <div class="px-2 pt-2 pb-4 sm:flex sm:p-0">
          <AccountDropdown class="hidden sm:block sm:ml-6" />
        </div>
        <div class="px-4 py-5 border-t border-gray-800 sm:hidden">
          <div class="mt-1">
            <a href="#" class="block text-gray-400 hover:text-white text-lg">Change account details</a>
            <a href="#" class="mt-2 block text-gray-400 hover:text-white text-lg">Sign out</a>
          </div>
        </div>
      </nav>
    </header>

    <div
      class="flex border border-gray-400 hover:border-gray-500 rounded shadow leading-tight h-full flex-col"
    >
      <div
        class="border border-gray-400 hover:border-gray-500 rounded shadow leading-tight flex h-16 w-full items-center px-3 justify-between rounded-l-lg mt-2 mx-2"
      >
        <h1 class="w-1/2 p-3 text-green-500 font-semibold text-lg">New Enquiry</h1>

        <div class="flex justify-center items-center">
          <div class="p-2 mr-3">
            <a href>
              <img class="w-10 h-10" src="https://img.icons8.com/officel/40/000000/plus-2-math.png" />
            </a>
          </div>
        </div>
      </div>

      <div
        class="border border-gray-400 hover:border-gray-500 rounded shadow leading-tight flex h-16 w-full items-center px-3 justify-between rounded-l-lg mt-2 mx-2"
      >
        <h1 class="w-1/2 p-3 text-blue-700 font-semibold text-lg">enquiry title</h1>

        <div class="flex justify-center items-center">
          <div class="p-2">
            <a href>
              <img class="w-10 h-10" src="https://img.icons8.com/ios-filled/50/000000/edit.png" />
            </a>
          </div>
          <div class="p-2">
            <a href>
              <img
                class="w-12 h-12 mr-2"
                src="https://img.icons8.com/color/48/000000/delete-sign.png"
              />
            </a>
          </div>
        </div>
      </div>

      <div
        class="border border-gray-400 hover:border-gray-500 rounded shadow leading-tight flex h-16 w-full items-center px-3 justify-between rounded-l-lg mt-2 mx-2"
      >
        <h1 class="w-1/2 p-3 text-blue-700 font-semibold text-lg">enquiry title</h1>

        <div class="flex justify-center items-center">
          <div class="p-2">
            <a href>
              <img class="w-10 h-10" src="https://img.icons8.com/ios-filled/50/000000/edit.png" />
            </a>
          </div>
          <div class="p-2">
            <a href>
              <img
                class="w-12 h-12 mr-2"
                src="https://img.icons8.com/color/48/000000/delete-sign.png"
              />
            </a>
          </div>
        </div>
      </div>
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

