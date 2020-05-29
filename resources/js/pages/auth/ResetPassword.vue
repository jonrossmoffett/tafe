<template>
    <div class="container mx-auto h-full flex justify-center items-center">
        <div class="bg-blue-900 md:w-1/3 md:h-auto h-full w-full md:rounded-lg shadow-xl p-6">
            <LogoSvg></LogoSvg>

            <h3 class="text-white text-1xl pt-8">Please enter your new password to confirm</h3>
            <div class="text-red-500 text-md-left pt-1" v-show="errors.message">{{ errors.message }}</div>
            <form class="pt-8" method="POST" @submit.prevent="resetPass">
                <div class="relative">
                    <label
                        for="password"
                        class="uppercase text-blue-500 text-xs font-bold absolute pl-3 pt-2"
                    >Password</label>

                    <div class>
                        <input
                            id="password"
                            type="password"
                            v-model="form.password"
                            class="pt-8 w-full rounded p-3 bg-blue-800 text-gray-100 outline-none focus:bg-blue-700"
                            name="email"
                            autofocus
                        />
                        <span
                            class="text-red-500 text-md-left pt-1"
                            v-show="errors.password"
                        >{{ errors.password ? (errors.password.join(' ')) : '' }}</span>
                    </div>

                    <div class="mt-3">
                        <label
                            for="password_confirmation"
                            class="uppercase text-blue-500 text-xs font-bold absolute pl-3 pt-2"
                        >Confirm Password</label>

                        <div class>
                            <input
                                id="password_confirmation"
                                type="password"
                                v-model="form.password_confirmation"
                                class="pt-8 w-full rounded p-3 bg-blue-800 text-gray-100 outline-none focus:bg-blue-700"
                                name="password_confirmation"
                                autofocus
                            />
                            <span
                                class="text-red-500 text-md-left pt-1"
                                v-show="errors.password_confirmation"
                            >{{ errors.password_confirmation ? (errors.password_confirmation.join(' ')) : '' }}</span>
                        </div>
                    </div>
                </div>

                <div class="pt-2">
                    <input class type="checkbox" name="remember" id="remember" v-model="form.remember"/>

                    <label class="text-white" for="remember">Remember Me</label>
                </div>

                <div class="pt-8">
                    <button
                        type="submit"
                        class="uppercase rounded text-gray-100 font-bold w-full bg-green-100 text-blue-800 py-2 px-3 text-center"
                    >Reset Password
                    </button>
                </div>

                <div class="flex justify-between pt-8 text-white text-sm font-bold">
                    <router-link :to="{name : 'login'}">Return to login</router-link>

                    <!--                    <router-link :to="{name : 'registration', query: $route.query}" class="color-primary">Register</router-link>-->
                </div>
            </form>
        </div>
    </div>
</template>

<script>
    import LogoSvg from "../../components/svg/LogoSvg";

    export default {
        name: "ResetPassword",
        components: {LogoSvg},
        data() {
            return {
                form: {
                    email : null,
                    password: null,
                    password_confirmation: null,
                    token: null,
                },
                errors: {}
            };
        },

        methods: {
            resetPass() {
                axios
                    .post("/password/reset", this.form)
                    .then(({ data }) => {
                        this.$toast.success(data.message);
                        this.$router.push("/login");
                    })
                    .catch(error => {
                        if (
                            error.response.status !== undefined &&
                            (error.response.status === 401 || error.response.status === 422)
                        ) {
                            this.errors = error.response.data.errors;
                            this.errors.message = error.response.data.message;
                            this.$toast.error("Please check your input");
                        } else {
                            this.$toast.error(this.errors.message);
                            console.log(error);
                        }
                    });
            }
        },

        mounted() {

            this.form.token = this.$route.query.token;
            this.form.email = this.$route.query.email;
            // axios.get(process.env.MIX_API_URL + "/sanctum/csrf-cookie");
        }
    }
</script>
