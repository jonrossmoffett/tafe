<template>
    <div class="container mx-auto h-full flex justify-center items-center">
        <div class="bg-blue-900 md:w-1/3 md:h-auto h-full w-full md:rounded-lg shadow-xl p-6">
            <LogoSvg></LogoSvg>
            <h3 class="text-white text-1xl pt-8">Please enter your email bellow to reset your password</h3>
            <div class="text-red-500 text-md-left pt-1" v-if="errors.message">{{ errors.message }}</div>
            <form class="pt-8" method="POST" @submit.prevent="resetPass">
                <div class="relative">
                    <label
                        for="email"
                        class="uppercase text-blue-500 text-xs font-bold absolute pl-3 pt-2"
                    >Email</label>

                    <div class>
                        <input
                            id="email"
                            type="email"
                            v-model="form.email"
                            class="pt-8 w-full rounded p-3 bg-blue-800 text-gray-100 outline-none focus:bg-blue-700"
                            name="email"
                            autocomplete="email"
                            autofocus
                            placeholder="your@email.com"
                        />
                        <span
                            class="text-red-500 text-md-left pt-1"
                            v-show="errors.email"
                        >{{ errors.email ? (errors.email.join(' ')) : '' }}</span>
                    </div>
                </div>

                <div class="pt-2">
                    <input class type="checkbox" name="remember" id="remember" v-model="form.remember" />

                    <label class="text-white" for="remember">Remember Me</label>
                </div>

                <div class="pt-8">
                    <button
                        type="submit"
                        class="uppercase rounded text-gray-100 font-bold w-full bg-green-100 text-blue-800 py-2 px-3 text-center"
                    >Reset Password</button>
                </div>

                <div class="flex justify-between pt-8 text-white text-sm font-bold">
                    <router-link :to="{name : 'login'}">Return to login</router-link>
                </div>
            </form>
        </div>
    </div>
</template>

<script>
    import LogoSvg from "../../components/svg/LogoSvg";
    export default {
        name: "ForgotPassword",
        components: {LogoSvg},
        data() {
            return {
                form: {
                    email: null
                },
                errors: {}
            }
        },

        methods: {
            resetPass() {
                axios
                    .post("/password/email", this.form)
                    .then(({ data }) => {
                        this.$toast.success("A reset link is mailed. Please check your Mail");
                        this.$router.push("/login");
                    })
                    .catch(error => {
                        if (
                            error.response.status != undefined &&
                            (error.response.status === 401 || error.response.status === 422)
                        ) {
                            this.errors = error.response.data.errors;
                            this.errors.message = error.response.data.message;
                            this.$toast.error("Please check your input");
                        } else {
                            this.errors.message = "Something went wrong.";
                            this.$toast.error(error.response.data.message);
                            console.log(error);
                        }
                    });
            }
        },

        mounted() {
            // axios.get(process.env.MIX_API_URL + "/sanctum/csrf-cookie");
        }
    }
</script>
