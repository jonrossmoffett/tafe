<template>
    <div class="inline-flex" v-if="!client">
        <span class="leading-relaxed  mx-2 text-blue-600">{{pagination.from || 0}}</span> - <span class="leading-relaxed  mx-2 text-blue-600">{{pagination.to || 0}}</span> of <span class="leading-relaxed  mx-2 text-teal-600">{{pagination.total}}</span>
        <a v-if="pagination.prevPageUrl" class="cursor-pointer bg-blue-500 hover:bg-blue-700 hover:text-gray-300 text-gray-800 font-bold py-1 px-4 mr-1 rounded inline-flex items-center" @click="$emit('prev');">
            Prev
        </a>
        <a class="bg-gray-500  hover:bg-gray-700 text-white font-bold py-1 px-4 mr-1 rounded" v-else :disabled="true">
            Prev
        </a>

        <a v-if="pagination.nextPageUrl" class="cursor-pointer bg-blue-500 hover:bg-blue-700 hover:text-gray-300 text-gray-800 font-bold py-1 px-4 mr-1 rounded inline-flex items-center" @click="$emit('next');">
            Next
        </a>
        <a class="bg-gray-500  hover:bg-gray-700 text-white font-bold py-1 px-4 mr-1 rounded" v-else :disabled="true">
            Next
        </a>
    </div>

    <div class="inline-flex"v-else>
        <span class="page-stats">
            {{pagination.from}} - {{pagination.to}} of {{filtered.length}}
            <span v-if="filtered.length < pagination.total">(filtered from {{pagination.total}} total entries)</span>
        </span>
        <a v-if="pagination.prevPage" class="button is-small pagination-previous" @click="$emit('prev');">
            Prev
        </a>
        <a class="button is-small pagination-previous" v-else :disabled="true">
           Prev
        </a>

        <a v-if="pagination.nextPage" class="button is-small pagination-next" @click="$emit('next');">
            Next
        </a>
        <a class="button is-small pagination-next" v-else :disabled="true">
            Next
        </a>
    </div>
</template>

<script>
    export default {
        props: ['pagination', 'client', 'filtered']
    }
</script>
