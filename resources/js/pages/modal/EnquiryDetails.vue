<template>

    <div class="fixed inset-0 w-full h-screen flex items-center justify-center bg-semi-100" @click="close">
        <div class="w-full max-w-3xl bg-white shadow-lg rounded-lg p-8 bg-gray-100 border-solid border-4 border-gray-400">
            <div class="modal-content py-4 text-left px-6 ">
                <!--Title-->
                <div class="flex justify-between items-center pb-3">
                    <p class="text-2xl font-bold"> {{ enquiry.title}}</p>
                    <div class="modal-close cursor-pointer z-50" @click="close">
                        <svg class="fill-current text-black" xmlns="http://www.w3.org/2000/svg" width="18"
                             height="18" viewBox="0 0 18 18">
                            <path
                                d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z"></path>
                        </svg>
                    </div>
                </div>

                <span :class="{'bg-green-600' : (enquiry.is_solved === 1), 'bg-red-600' : (enquiry.is_solved === 0)}"
                      v-text="enquiry.is_solved === 1 ? 'Solved' : 'Unsolve' "
                      class="inline-block text-white text-sm px-2 rounded-full uppercase font-semibold tracking-wide"></span>


                <div class="block group hover:bg-blue p-4 border-b">
                    <p class="font-bold text-lg mb-1 text-black group-hover:text-white">Name</p>
                    <p class="text-grey-darker mb-2 group-hover:text-white">{{ enquiry.name}}</p>
                </div>

                <div class="flex block group hover:bg-blue p-4 border-b">
                    <div class="w-1/2 h-12">
                        <p class="font-bold text-lg mb-1 text-black group-hover:text-white">Email</p>
                        <p class="text-grey-darker mb-2 group-hover:text-white">{{ enquiry.email}}</p>
                    </div>
                    <div class="w-1/2 h-12">
                        <p class="font-bold text-lg mb-1 text-black group-hover:text-white">Phone</p>
                        <p class="text-grey-darker mb-2 group-hover:text-white">{{ enquiry.phone}}</p>
                    </div>
                </div>


                <div class="flex block group hover:bg-blue p-4 border-b">
                    <div class="w-1/2 h-12">
                        <p class="font-bold text-lg mb-1 text-black group-hover:text-white">Type</p>
                        <p class="text-grey-darker mb-2 group-hover:text-white">{{ enquiry.type}}</p>
                    </div>
                    <div class="w-1/2 h-12">
                        <p class="font-bold text-lg mb-1 text-black group-hover:text-white">Date</p>
                        <p class="text-grey-darker mb-2 group-hover:text-white">{{ enquiry.created_at}}</p>
                    </div>
                </div>

                <div class="block group hover:bg-blue p-4 border-b">
                    <p class="font-bold text-lg mb-1 text-black group-hover:text-white">Description</p>
                    <p class="text-grey-darker mb-2 group-hover:text-white">{{ enquiry.description}}</p>
                </div>

                <!--Footer-->
                <div class="flex justify-end pt-2">
                    <button
                        class="modal-close px-4 bg-indigo-500 p-3 rounded-lg cursor-pointer  text-white hover:bg-indigo-400"
                        @click="close">Close
                    </button>
                </div>

            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "EnquiryDetails",

        props: {
            enquiry: {
                type: Object,
                default: null
            },
        },

        methods: {
            close() {
                this.$emit('closeEnquiryDetails')
            }
        },
    }
</script>
