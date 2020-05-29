import moment from "moment";
import Vue from 'vue';

Vue.filter('shortText', function (value) {
    if (!value) return '';
    if (value.length > 43) {
        return value.slice(0, 43) + '...';
    }
    return value;
});

Vue.filter('formateDate', function (value) {
    if (!value) return '';
    if (value) {
        return moment(String(value)).format('MMMM Do YYYY')
    }
});
