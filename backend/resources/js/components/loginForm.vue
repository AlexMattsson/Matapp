<template>

    <div class="card text-center">

    
        <div class="form-group">
            <input class="form-control" v-model="email" name="email" type="email" placeholder="E-mail address" autofocus required>
        </div>

        <div class="form-group">
            <input class="form-control" v-on:keyup.enter="login" v-model="password" name="password" type="password" placeholder="Password" required/>
        </div>

        <div class="info info--error" v-if="infoError">Login failed. Please try again.</div>

        <button class="btn btn-success" @click="login">Logga In</button>
    </div>
    
</template>

<style scoped>

    .info--error {
        margin-bottom: 10px;
    }
    .card {
        width: 30%;
        margin-top: 25vh;
        margin-left: auto;
        margin-right: auto;
        padding: 5%;
    }
    
    .form-control {
        margin-left: auto;
        margin-right: auto;
        width: 80%;
    }

    .btn-success {
        margin-left: auto;
        margin-right: auto;
        width: 25%;
    }
</style>

<script>
export default {
    data() {
        return {
            infoError: false,
            email: '',
            password: '',
        };
    },

    methods: {
        async login() {
            await axios
                .post('/auth/login', {
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
                    this.infoError = true;
                    console.log(error);
                });
        },
    },
};
</script>