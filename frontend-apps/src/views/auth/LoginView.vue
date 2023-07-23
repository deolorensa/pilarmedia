<template>
  <div class="bg-emerald-600 h-screen">
    <div class="flex items-center h-screen max-h-xl">
      <div
        class="mx-auto max-w-md bg-white rounded-xl border border-gray-200 shadow-xl p-5"
      >
        <div class="space-y-2 text-end px-5" action="#">
          <img
            class="text-center mx-auto px-16"
            src="@/assets/logo-aksesmu.png"
            alt=""
          />
          <h3 class="text-xl text-center font-bold text-emerald-500">
            Login User
          </h3>
          <div>
            <label
              for="email"
              class="block mb-2 text-sm font-medium text-gray-900 text-start"
              >Your email</label
            >
            <input
              v-model="email"
              type="email"
              name="email"
              id="email"
              class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg block w-full p-2.5"
              placeholder="name@email.com"
              required
            />
          </div>
          <div>
            <label
              for="password"
              class="block mb-2 text-sm font-medium text-gray-900 text-start"
              >Your password</label
            >
            <input
              v-model="password"
              type="password"
              name="password"
              id="password"
              placeholder="••••••••"
              class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
              required
            />
          </div>
          <div>
            <button
              @click="login()"
              type="button"
              class="w-full text-white bg-emerald-600 hover:bg-white hover:text-emerald-600 hover:shadow-lg border hover:border-emerald-600 font-medium rounded-lg text-sm px-5 py-2.5 text-center my-5"
            >
              Login
            </button>
          </div>
          <router-link
            class="text-sm text-gray-400 hover:underline"
            to="/register"
            >Register ?</router-link
          >
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      email: "",
      password: "",
    };
  },
  methods: {
    async login() {
      await axios
        .post("http://localhost:3000/login", {
          email: this.email,
          password: this.password,
        })
        .then((response) => {
          this.alertLoginSucces();
          console.log(response);
          this.$store.commit("loginSucces", response.data.accessToken);
          this.$store.commit("SetLogin", response.data.roles);
          this.$router.replace({ name: "home" });
        })
        .catch((error) => {
          this.alertLoginError(error);
        });
    },
    alertLoginSucces() {
      this.$swal({
        position: "center",
        icon: "success",
        title: "Log In Succes",
        showAlertLoginSucces: false,
        timer: 1500,
      });
    },
    alertLoginError() {
      this.$swal({
        position: "center",
        icon: "error",
        title: "Login Failed, Username or Password Wrong !!!",
        showAlertLoginError: false,
        timer: 1500,
      });
    },
  },
};
</script>

<style></style>
