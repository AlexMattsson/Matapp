<template>
    <div>
        <h1 class="text-center pt-2" :class="{'olearys': resturant == 'Olearys'}">{{ resturant }}</h1>
        <div class="container row justify-content-center py-3">

            <v-date-picker
                :color="resturant == 'Olearys'? 'green': 'blue'"
                mode='range'
                v-model='selectedDate'
                show-caps>
            </v-date-picker>
        </div>
        <chart :data='data' :resturant="resturant" ></chart>
        <comments :data='data' :resturant='resturant'></comments>
    </div>
</template>

<script>
import chart from './chart';
import comments from './comments';
// import { vDatePicker } from 'v-calendar';
export default {
    data() {
        return {
            selectedDate: {
                start: new Date(2019, 12, 1),
                end: new Date(2019, 12, 5)
            },
        };
    },
    props: [
        'data',
        'resturant'
    ],
    components: {
        chart,
        comments,
    },
    
}
</script>
<style lang="scss" scoped>

    h1 {
        color: #005EAA;
    }
    .olearys {
        color: #2E9B88;
    }

</style>