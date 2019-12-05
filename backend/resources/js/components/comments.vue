<template>
    <div class="wrapper container row justify-content-center">
        <div class="list-group">
            <div 
                class="list-group-item list-group-item-action flex-column align-items-start"
                v-for="(item, index) in list" v-bind:key="index"
            >
                <div class="d-flex w-100 justify-content-between">
                    <h5 class="mb-1">{{ item.cause }}</h5>
                    <!-- <small>20% av dagens feedback</small> -->
                </div>
                <small>{{ item.counter}} person(er) har skickat in detta</small>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    props: [
        'data',
        'resturant'
    ],
    data() {
        return {
            list: undefined  
        }
    },
    created() {
        this.parseIncomingData();
    },
    methods: {
        parseIncomingData()  {
            let data = [];
            this.data.forEach(element => {
                if(element.resturant == this.resturant) {
                    if(element.cause) {
                        let existsAlready = false;
                        data.forEach(index => {
                            if(element.cause == index.cause) {
                                index.counter++;
                                existsAlready = true;
                            }
                        });
                        if(!existsAlready) {
                            data.push({cause: element.cause, counter: 1});
                        }
                    }
                }
            });
            this.list = _.sortBy( data, 'counter' ).reverse();
        }
    }
}
</script>
<style lang="scss" scoped>
    @media only screen and (min-width: 768px) {
        .list-group {
            width: 30vw;
        }
    }
    .wrapper {
        padding-top: 30px;
    }
</style>