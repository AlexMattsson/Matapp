<template>
    <div>
        <input type="text" v-model="email" name="email" />
        <input type="password" v-model="password" name="password" />
        <button @click="login">Skicka in</button>
    </div>
</template>

<script>
export default {
    data() {
        return {
            email: '', 
            password: ''
        }
    },

    methods: {
        async login() {
            let { data } = await axios.post('/login/auth', {
                    "email": this.email,
                    "password": this.password
                });
            window.localStorage.setItem('token', data);
            window.location.replace('/');
        },
    },
}
</script>