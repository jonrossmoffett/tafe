<template>
    <div class="flex justify-center bg-grey-lighter">
        <div class="w-full max-w-2xl">
            <form class="w-1/7 mr-auto bg-white  shadow-md rounded px-8 pt-6 pb-8 mb-4"
                  @submit.prevent="submitEnquiryForm">
                <InputField
                    name="title"
                    label="Enquiry title"
                    :errors="errors"
                    placeholder="Enquiry title"
                    @update:field="form.title = $event"
                    :data="form.title"
                />
                <div class="relative pb-4">
                    <label class="text-blue-500 pt-2 uppercase text-xs font-bold absolute">Enquiry Types</label>
                    <br>
                    <select v-model="form.type"
                            class="mt-3 block appearance-none w-full bg-gray-200 border border-gray-200 text-gray-700 py-3 px-4 pr-8 rounded leading-tight focus:outline-none focus:bg-white focus:border-gray-500">
                        <option v-for="enquiryType in enquiryTypes" :key=enquiryType.id :value=enquiryType.id>
                            {{ enquiryType.name }}
                        </option>
                    </select>
                    <p class="text-red-600 text-sm" v-show="errors.type">{{ errors.type ? errors.type.join(' ') : ''
                        }}</p>
                </div>
                <InputField
                    name="email"
                    label="Email"
                    :errors="errors"
                    placeholder="Email"
                    @update:field="form.email = $event"
                    :data="form.email"
                />
                <InputField
                    name="phone"
                    label="Phone Number"
                    :errors="errors"
                    placeholder="Phone Number"
                    @update:field="form.phone = $event"
                    :data="form.phone"
                />

                <div class="relative pb-4">
                    <label class="text-blue-500 pt-2 uppercase text-xs font-bold absolute">Enquiry Description</label>
                    <br>
                    <textarea rows="5"
                              class="mt-3 resize-y border rounded focus:outline-none focus:shadow-outline w-full text-gray-900 border-b px-1 py-1 focus:outline-none focus:border-blue-400"
                              v-model="form.description"
                              placeholder="Enquiry Description"
                    ></textarea>
                    <p class="text-red-600 text-sm" v-if="errors.description">{{errors.description}}</p>
                </div>

                <div class="flex justify-end">
                    <a href="javascript:history.go(-1)"
                       class="py-2 px-4 rounded text-red-700 border mr-5 hover:border-red-700">Cancel</a>
                    <button :disabled="isLoading" class="bg-blue-500 py-2 px-4 text-white rounded hover:bg-blue-400">Add
                        New Enquiry
                    </button>
                </div>
            </form>
        </div>
    </div>

</template>

<script>
    import InputField from "../../components/input";

    export default {
        name: "EnquirysCreate",

        components: {
            InputField
        },

        data: function () {
            return {
                isLoading: false,
                form: {
                    title: null,
                    type: null,
                    description: null,
                    email: null,
                    phone: null,
                },
                enquiryTypes: [],
                errors: []
            };
        },

        mounted() {
            this.getEnqueryTypes();
            this.form.email = this.$store.getters.user.email;
        },

        methods: {
            getEnqueryTypes: function () {
                axios
                    .get('/enquiry-types')
                    .then(({data}) => {
                        this.enquiryTypes = data.data;
                    }).catch(errors => {
                    console.log(errors);
                    this.errors = errors.response.data.errors;
                    this.$toast.error('Something went wrong from enquiry types')
                });
            },

            submitEnquiryForm: function () {
                this.isLoading = true;

                axios
                    .post("/enquiry", this.form)
                    .then(({data: {data, message}}) => {
                        this.$toast.success(message)
                        this.errors = {};
                        this.$router.push({name: 'enquiry'})
                    })
                    .catch(errors => {
                        if (errors.response !== undefined && errors.response.status === 422) {/* validation error */
                            this.errors = errors.response.data.errors;
                            this.$toast.error('Please check your input')
                        }else{
                            this.$toast.error('Something went wrong')
                        }
                    })
                    .finally(() => {
                        this.isLoading = false;
                    });
            }
        }
    };
</script>

<style scoped>
</style>
