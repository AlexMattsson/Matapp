let mix = require('laravel-mix');

mix.js('resources/js/app.js', 'public/js')
    .extract(['vue', 'lodash', 'chart.js', 'axios'])
mix.disableNotifications();