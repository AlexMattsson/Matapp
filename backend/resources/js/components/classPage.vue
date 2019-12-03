<template>
    <div class="wrapper">
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th scope="col" style="display:none;">id</th>
                    <th scope="col">Klass</th>
                    <th scope="col">Resturang</th>
                    <th scope="col"></th>
                </tr>
            </thead>
            <tbody>
                <class-row v-for="index in data" 
                    :key="index.id" 
                    :data="index"
                    @delete="deleteIndex"
                ></class-row>
            </tbody>
        </table>
        <button type="button" class="btn btn-primary" @click.prevent="addClassModal()">Add class</button>

        <modals-container @close="updateData"></modals-container>
    </div>
    
</template>

<script>
import classRow from './classRow';
import createClassForm from './createClassForm';

export default {
    props: [
        'payload'
    ],
    data() {
        return {
            'data': null,
        }
    },
    created() {
        this.data = this.payload;
    },
    components: {
        classRow,
        createClassForm
    },
    methods: {
        deleteIndex(id) {
            for (let i = 0; i < this.data.length; i++) {
                if(this.data[i].id == id) {
                    this.remove(this.data, this.data[i]);       
                    break;
                }
            }
        },
        remove(array, element) {
            const index = array.indexOf(element);

            if (index !== -1) {
                array.splice(index, 1);
            }
        },
        addClassModal() {
            this.$modal.show(createClassForm, {
                draggable: false,
                resizable: false,
                width: "70%",
                height: "70%",
                adaptive: true,
                
            });
            
        },
        updateData() {
            axios.get('/api/classes/get').then(res => {
                this.data = res.data;
            })
        }
    }
}
</script>

<style lang="scss" scoped>
    .wrapper {
        padding: 25px;
    }
</style>