window.axios = require('axios');
window.Chart = require('chart.js');
window.$ = window.jQuery = require('jquery');
window._ = require('lodash');
window.Vue = require('vue');

window.axios.defaults.headers.common = {
    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content'),
    'X-Requested-With': 'XMLHttpRequest'
};

import chart from './components/chart';
Vue.component('chart', chart);
import classPage from './components/classPage';
Vue.component('class-page', classPage);

new Vue({
    el: '#app',
})
