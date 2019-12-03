<template>
    <tr>
        <th scope="row" style="display:none;">{{ data.id }}</th>
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
            let confirmDelete = confirm("Är du säker att du vill ta bort klassen " + this.data.name + "?");
            if(confirmDelete) {
                axios.delete('/class/' + this.data.id + '/delete').then((res) => {
                    this.$emit('delete', this.data.id);
                });
            }
            
        },
        updateRow() {
            axios.patch('/class/' + this.data.id + '/update', {
              'resturant_id': this.selected,
            }).then((res) => {
                console.log(res.data);
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

<style lang="scss" scoped>
    .remove {
        color: red;
        margin-left: 10px;
    }
</style>