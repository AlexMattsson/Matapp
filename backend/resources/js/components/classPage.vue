<template>
    <table class="table table-striped" >
                    <thead>
                        <tr>
                            <th scope="col">id</th>
                            <th scope="col">Klass</th>
                            <th scope="col">Resturang</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        <class-row v-for="index in data" :key="index.id" :data="index"></class-row>
                        
                    </tbody>
                </table>
    
</template>

<script>
import classRow from './classRow';

export default {
    props: [
        'data'
    ],

    components: {
        classRow
    }
}
</script>

<style>

</style>