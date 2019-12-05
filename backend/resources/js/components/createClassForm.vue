<template>
    <form>
        <h2>Lägg till en ny klass</h2>
        <div class="form-group">
            <label for="name">Klassnamn</label>
            <input class="form-control" id="name" placeholder="TE4" maxlength="8" v-model="name">
        </div>
        <div class="form-group">
            <input type="radio" id="addone" :value="1" v-model="selected">
        <label for="addone">Greek Grill</label>
        <input type="radio" id="addtwo" :value="2" v-model="selected">
        <label for="addtwo">Olearys</label>
        </div>
        <button type="submit" class="btn btn-primary" @click.prevent="onSubmit()">Skicka</button>
    </form>
</template>

<script>
export default {
    data() {
        return {
            'selected': 1,
            'name': undefined,  
        }
    },
    methods: {
        async onSubmit() {
            if(this.name) {
                await axios.post('/class/create', {
                    "name": this.name,
                    "resturant_id": this.selected
                });
                this.$emit('close');
            }
            

        }
    }
}
</script>

<style lang="scss" scoped>
    form {
        padding: 20px;
    }
    #name {
        width: 100px;
    }
</style>