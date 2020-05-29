<template>
    <div class="w-full ">
        <div v-if="isLoading">
            <Loading></Loading>
        </div>
        <div v-if="!isLoading">
            <div class="w-full mx-auto">
                <div class="bg-white pb-4 px-4 rounded-md w-full">

                    <div class="flex">
                        <div class="w-1/2 px-2 mt-2 float-left">
                            <div class="w-full sm:w-64 inline-block relative float-left">
                                <select v-model="tableData.length" @change="getEnquiries()"
                                        class="block appearance-none w-full bg-gray-200 border border-gray-200 text-gray-700 py-3 px-4 pr-8 rounded leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                                        id="grid-state">
                                    <option v-for="(records, index) in perPage" :key="index" :value="records">
                                        {{records}}
                                    </option>
                                </select>
                            </div>
                        </div>

                        <div class="w-1/2 px-2 mt-2 float-right">
                            <div class="w-full sm:w-64 inline-block relative float-right">
                                <input v-model="tableData.search" @input="getEnquiries()"
                                       class="bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500 leading-snug block text-sm text-gray-600 pl-8"
                                       placeholder="Search"/>
                            </div>
                        </div>
                    </div>

                    <div class="overflow-x-auto mt-6">

                        <datatable :columns="columns" :sortKey="sortKey" :sortOrders="sortOrders" @sort="sortBy">
                            <tbody class="text-sm font-normal text-gray-700 overflow-y-scroll">
                            <tr v-for="(enquiry, index) in enquiries" :key="enquiry.id"
                                class="hover:bg-gray-100 border-b border-gray-200 py-10">
                                <td class="px-4 py-4">{{enquiry.title}}</td>
                                <td class="px-4 py-4">{{enquiry.name}}</td>
                                <td class="px-4 py-4">
                                    <select :disabled="disabled" v-if="isAdmin" v-model="enquiry.typeId"
                                            @change="saveEnquiry(enquiry.unique_id, enquiry)"
                                            class="block appearance-none w-full bg-gray-200 border border-gray-200 text-gray-700 py-3 px-4 pr-8 rounded leading-tight focus:outline-none focus:bg-white focus:border-gray-500">
                                        <option v-for="(enquiryTypes) in enquiryTypes" :key="enquiryTypes.id"
                                                :value="enquiryTypes.id"> {{enquiryTypes.name}}
                                        </option>
                                    </select>
                                    <div v-else>{{enquiry.type}}</div>
                                </td>
                                <td class="px-4 py-4">
                                    <select :disabled="disabled" v-if="isAdmin" v-model="enquiry.is_solved"
                                            @change="saveEnquiry(enquiry.unique_id, enquiry)"
                                            class="block appearance-none w-full bg-gray-200 border border-gray-200 text-gray-700 py-3 px-4 pr-8 rounded leading-tight focus:outline-none focus:bg-white focus:border-gray-500">
                                        <option value="1"> Solved</option>
                                        <option value="0"> Unsolved</option>
                                    </select>

                                    <div v-else>
                                        <span :class="{'bg-green-600' : (enquiry.is_solved === 1), 'bg-red-600' : (enquiry.is_solved === 0)}"
                                              v-text="enquiry.is_solved === 1 ? 'Solved' : 'Unsolve' "
                                              class="inline-block text-white text-xs px-2 rounded-full uppercase font-semibold tracking-wide"></span>
                                    </div>
                                </td>
                                <td class="px-4 py-4">
                                    <p>{{enquiry.email}}</p>
                                    <p>{{enquiry.phone}}</p>
                                </td>
                                <td class="px-4 py-4">{{enquiry.description | shortText}}</td>
                                <td class="px-4 py-4">{{enquiry.created_at | formateDate}}</td>
                                <td class="p-3 px-5 flex justify-end ">
                                    <div class="inline-flex">
                                        <button v-if="isAdmin" @click="showEnquiryDetails(enquiry)"
                                                class="text-sm bg-blue-500 hover:bg-blue-700 text-white py-1 px-2 focus:outline-none focus:shadow-outline">
                                            View
                                        </button>
                                        <button @click="deleteEnquiry(enquiry.unique_id, index)"
                                                class="text-sm bg-red-500 hover:bg-red-700 text-white py-1 px-2 focus:outline-none focus:shadow-outline">
                                            Delete
                                        </button>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </datatable>
                        <div class="w-full flex justify-center border-t border-gray-100 pt-4 items-center">
                            <pagination :pagination="pagination"
                                        @prev="getEnquiries(pagination.prevPageUrl)"
                                        @next="getEnquiries(pagination.nextPageUrl)">
                            </pagination>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <EnquiryDetails :enquiry="enquiry" v-if="showModal" @closeEnquiryDetails="closeEnquiryDetails" ></EnquiryDetails>
    </div>

</template>

<script>

    import Loading from "../../components/Loading";
    import Pagination from '../../components/datatable/Pagination';
    import Datatable from '../../components/datatable/Datatable';
    import EnquiryDetails from "../modal/EnquiryDetails";

    export default {
        name: "EnquiryIndex",
        components: {EnquiryDetails, Loading, datatable: Datatable, pagination: Pagination},
        data: function () {
            let sortOrders = {};

            let columns = [
                {width: '15%', label: 'Title', name: 'title'},
                {width: '12%', label: 'Name', name: 'name'},
                {width: '13%', label: 'Type', name: 'type'},
                {width: '10%', label: 'Status', name: 'status'},
                {width: '10%', label: 'Email/Phone', name: 'email'},
                {width: '23%', label: 'Description', name: 'description'},
                {width: '10%', label: 'Date', name: 'created_at'},
                {width: '7%', label: 'Action'},
            ];

            columns.forEach((column) => {
                sortOrders[column.name] = -1;
            });
            return {
                enquiries: [],
                columns: columns,
                sortKey: 'deadline',
                sortOrders: sortOrders,
                perPage: ['5', '10', '20', '30'],
                tableData: {
                    draw: 0,
                    length: 10,
                    search: '',
                    column: 0,
                    dir: 'desc',
                },
                pagination: {
                    lastPage: '',
                    currentPage: '',
                    total: '',
                    lastPageUrl: '',
                    nextPageUrl: '',
                    prevPageUrl: '',
                    from: '',
                    to: ''
                },
                enquiryTypes: [],
                loading: false,
                disabled: false,
                type: null,
                showModal : false,
                enquiry : {}
            };
        },

        mounted() {
            this.getEnquiries();
            this.getEnquiryTypes();
        },

        computed: {
            isLoading() {
                return this.loading;
            },

            isAdmin() {
                return this.$store.getters.isAdmin;
            }

        },

        methods: {
            getEnquiries(url = "/enquiry") {
                this.loading = true;
                this.tableData.draw++;
                axios
                    .get(url, {params: this.tableData})
                    .then(({data}) => {
                        this.enquiries = data.data.data;
                        this.configPagination(data.data);
                        this.loading = false;
                    })
                    .catch(error => {
                        if (error.response !== undefined && error.response.status === 422) {/* validation error */
                            this.errors = error.response.data.message;
                        }
                    })
                    .finally(() => {
                        this.loading = false;
                    });
            },
            configPagination(data) {
                this.pagination.lastPage = data.last_page;
                this.pagination.currentPage = data.current_page;
                this.pagination.total = data.total;
                this.pagination.lastPageUrl = data.last_page_url;
                this.pagination.nextPageUrl = data.next_page_url;
                this.pagination.prevPageUrl = data.prev_page_url;
                this.pagination.from = data.from;
                this.pagination.to = data.to;
            },
            sortBy(key) {
                this.sortKey = key;
                this.sortOrders[key] = this.sortOrders[key] * -1;
                this.tableData.column = this.getIndex(this.columns, 'name', key);
                this.tableData.dir = this.sortOrders[key] === 1 ? 'asc' : 'desc';
                this.getEnquiries();
            },
            getIndex(array, key, value) {
                return array.findIndex(i => i[key] === value)
            },

            getEnquiryTypes: function () {
                axios
                    .get('/enquiry-types')
                    .then(({data}) => {
                        this.enquiryTypes = data.data;
                    }).catch(errors => {
                    this.errors = errors.response.data.errors;
                    this.$toast.error('Something went wrong from enquiry types')
                });
            },

            deleteEnquiry(enquiryId, index) {

                let message = {
                    title: "Confirmation",
                    body: "Do you really want to delete this Enquiry?"
                };
                this.$dialog.confirm(message).then(() => {
                    axios
                        .delete(`/enquiry/${enquiryId}`)
                        .then(({data: {data, message}}) => {
                            this.enquiries.splice(index, 1);
                            this.$toast.success(message);
                        }).catch(error => {
                        if (error.response !== undefined && error.response.status === 422) {/* validation error */
                            this.errors = error.response.data.message;
                        }
                        this.$toast.error(error.response.data.message);
                    });
                });
            },
            saveEnquiry(enquiryId, enquiry) {
                this.disabled = true;
                axios
                    .put(`/enquiry/${enquiryId}`, {type: enquiry.typeId, is_solved: enquiry.is_solved})
                    .then(({data: {data, message}}) => {
                        enquiry.type = data.type;
                        this.$toast.success(message);
                    }).catch(error => {
                    if (error.response !== undefined && error.response.status === 422) {/* validation error */
                        this.errors = error.response.data.message;
                    }
                    this.$toast.error(error.response.data.message);
                }).finally(() => {
                    this.disabled = false;
                });
            },

            showEnquiryDetails(enquiry){
                this.enquiry = enquiry;
                this.showModal = true;
            },
            closeEnquiryDetails(){
                this.enquiry = {};
                this.showModal = false;
            }
        }
    };
</script>


<style>

    thead tr th:first-child {
        border-top-left-radius: 10px;
        border-bottom-left-radius: 10px;
    }

    thead tr th:last-child {
        border-top-right-radius: 10px;
        border-bottom-right-radius: 10px;
    }

    tbody tr td:first-child {
        border-top-left-radius: 5px;
        border-bottom-left-radius: 0px;
    }

    tbody tr td:last-child {
        border-top-right-radius: 5px;
        border-bottom-right-radius: 0px;
    }


</style>
