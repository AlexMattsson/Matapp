<template>
    <tr>
        <th scope="row">{{ data.id }}</th>
        <td>{{ data.name }}</td>
        <td>
        <input type="radio" :id="data.id + 'one'" :value="1" v-model="selected">
        <label :for="data.id + 'one'">Greek Grill</label>
        <input type="radio" :id="data.id + 'two'" :value="2" v-model="selected">
        <label :for="data.id + 'two'">Olearys</label>
        </td>
        <a href="#" @click.prevent="onRemove()" class="remove">ta bort</a>
    </tr>
</template>

<script>
export default {
    props: [
        'data'
    ],
    data() {
        return {
            'selected': undefined,
        }
    },
    created() {
        this.selected = this.data.resturant_id;
    },
    methods: {
        onRemove() {
            console.log('test');
        },
        updateRow() {
            axios.patch('/class/' + this.data.id,{
              'resturant_id': this.selected,
            }).then((res) => {
                console.log(res);
            });
        }
    },
    watch: {
        selected: {
            immediate: true,
            handler(newVal, oldVal) {
                if(oldVal != undefined) {
                    this.updateRow();
                }
            },
        }
    }
}
</script>

<style>

</style>