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
            password: '',
        };
    },

    methods: {
        async login() {
            await axios
                .post('/login/auth', {
                    email: this.email,
                    password: this.password,
                })
                .then(response => {
                    window.localStorage.setItem(
                        'token',
                        String('bearer ' + response.data.token)
                    );
                    var token = localStorage.getItem('token');
                    document.cookie = 'token' + '=' + response.data.token;
                    window.location.replace('/');
                })
                .catch(error => {
                    console.log(error);
                });
        },
    },
};
</script>