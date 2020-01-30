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
        <button v-on:click="search"/>
        <chart :key="componentKey" :data='selectedData' :resturant="resturant" ></chart>
        <comments :key="componentKey" :data='selectedData' :resturant='resturant'></comments>
    </div>
</template>

<script>
import chart from './chart';
import comments from './comments';
import { vDatePicker } from 'v-calendar';
export default {
    data() {
    
        return {
            selectedDate: {
                start: new Date(2019, 12, 1),
                end: new Date(2019, 12, 5),
            },
            componentKey: 0,
        };
    },
    created() {
        this.selectedData = [...this.data];
    },
    methods: {
        search() {
            let selectedData = [];
            let timebetween = this.selectedDate.end.getTime() - this.selectedDate.start.getTime();
            let daysBetween = timebetween / (1000*3600*24);
            var startDate = new Date(this.selectedDate.start);
            console.log(startDate);
            for (let i = 0; i < daysBetween; i++) {
                this.data.forEach(element => {
                   var newDate = new Date();
                   newDate.setDate(startDate.getDate()+i);
                    if (isSameDay(new Date(element.created_at), newDate)) {
                        console.log("Added " + new Date(element.created_at) + " is equal as " + newDate);
                        selectedData.push(element);
                    }
                });
            }
            console.log(selectedData);
            this.selectedData = [...selectedData];
            this.forceRerender();
        },
        forceRerender() {
            this.componentKey += 1;  
        }
    },
    props: [
        'selectedData',
        'data',
        'resturant'
    ],
    components: {
        chart,
        comments,
    },
    
    
}

function isSameDay(date1, date2) {
    //console.log(date1 + ":Date 1  Date 2:" + date2);
    return date1.getFullYear() === date2.getFullYear() &&
    date1.getMonth() === date2.getMonth() &&
    date1.getDate() === date2.getDate()
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