
  
<template>
  <div class="flex h-full w-full flex-col m-0 p-0 bg-grey-300 justify-center content-center">
    <div class="w-full max-w-l h-full">
      <form class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4 h-full">
        <div class="mb-4">
          <label class="block text-gray-700 text-sm font-bold mb-2" for="username">Enquiry Title</label>
          <input
            class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
            id="username"
            type="text"
            placeholder="Title"
          />
        </div>
        <label class="block text-gray-700 text-sm font-bold mb-2" for="username">Enquiry Type</label>

        <div class="inline-block relative w-full">
          <select
            class="block appearance-none w-full bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline"
          >
            <option>Livestock</option>
            <option>Warranty</option>
            <option>Other</option>
          </select>

          <div
            class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700"
          >
            <svg
              class="fill-current h-4 w-4"
              xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 20 20"
            >
              <path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z" />
            </svg>
          </div>
        </div>

        <label class="block text-gray-700 text-sm font-bold mb-2 mt-3" for="username">Description</label>

        <div class="row flex h-48">
          <div class="col w-full h-full">
            <div class="box border rounded flex flex-col shadow bg-white h-full">
              <textarea
                placeholder="hey"
                class="text-grey-darkest flex-1 p-2 m-1 bg-transparent h-full"
                name="tt"
              ></textarea>
            </div>
          </div>
        </div>

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

