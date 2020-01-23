window.axios = require('axios');
window.Chart = require('chart.js');
window.$ = window.jQuery = require('jquery');
window._ = require('lodash');
window.Vue = require('vue');

window.axios.defaults.headers.common = {
    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content'),
    'X-Requested-With': 'XMLHttpRequest',
};
import infotree from './components/informationTree';
import classPage from './components/classPage';
import loginForm from './components/loginForm';
import VModal from 'vue-js-modal';
Vue.component('info-tree', infotree);
Vue.component('class-page', classPage);
Vue.component('login-form', loginForm);
import VCalendar from 'v-calendar';

Vue.use(VCalendar, {
    formats: {
        title: 'MMMM YYYY',
        weekdays: 'W',
        navMonths: 'MMM',
        input: ['L', 'YYYY-MM-DD', 'YYYY/MM/DD'],
        dayPopover: 'L',
    },
});

Vue.use(VModal, { dynamic: true, dynamicDefaults: { clickToClose: false } });

new Vue({
    el: '#app',
});
