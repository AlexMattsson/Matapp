<template>
    <tr>
        <th scope="row">{{ data.id }}</th>
        <td>{{ data.name }}</td>
        <td>
        <input type="radio" id="one" :value="1" v-model="selected">
        <label for="one">Greek Grill</label>
        <input type="radio" id="two" :value="2" v-model="selected">
        <label for="two">Olearys</label>
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
            'selected': null,
        }
    },
    created() {
        this.selected = this.data.resturant_id;
    },
    methods: {
        onRemove() {
            console.log('test');
        }
    }
}
</script>

<style>

</style>