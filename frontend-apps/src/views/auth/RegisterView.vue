<template>
  <div class="bg-emerald-600 h-screen">
    <div class="flex items-center h-screen max-h-xl">
      <div
        class="mx-auto max-w-md bg-white rounded-xl border border-gray-200 shadow-xl p-5"
      >
        <form
          @submit="register()"
          class="space-y-2 text-end px-5"
          action="/login"
        >
          <img
            class="text-center mx-auto px-16"
            src="@/assets/logo-aksesmu.png"
            alt=""
          />
          <h3 class="text-xl text-center font-bold text-emerald-500">
            Register User
          </h3>
          <div>
            <label
              for="name"
              class="block mb-2 text-sm font-medium text-gray-900 text-start"
              >Your name</label
            >
            <input
              v-model="name"
              type="text"
              name="name"
              id="name"
              class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg block w-full p-2.5"
              placeholder="name..."
              required
            />
          </div>
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
            <label
              for="confPassword"
              class="block mb-2 text-sm font-medium text-gray-900 text-start"
              >Your password</label
            >
            <input
              v-model="confPassword"
              type="password"
              name="confPassword"
              id="confPassword"
              placeholder="••••••••"
              class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
              required
            />
          </div>
          <div>
            <button
              type="submit"
              class="w-full text-white bg-emerald-600 hover:bg-white hover:text-emerald-600 hover:shadow-lg border hover:border-emerald-600 font-medium rounded-lg text-sm px-5 py-2.5 text-center my-5"
            >
              Register
            </button>
          </div>
          <router-link
            class="text-xs text-gray-500 hover:text-emerald-600 hover:underline"
            to="/login"
            >back to login ?</router-link
          >
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      name: "",
      email: "",
      password: "",
      confPassword: "",
    };
  },
  methods: {
    async register() {
      await axios
        .post("http://localhost:3000/users", {
          email: this.email,
          password: this.password,
          confPassword: this.confPassword,
          name: this.name,
        })
        .then((response) => {
          this.alertRegisterSucces();
          this.$store.commit("setRegister", response.data);
        })
        .catch((error) => {
          this.alertRegisterError(error);
        });
    },
    alertRegisterSucces() {
      this.$swal({
        position: "center",
        icon: "success",
        title: "Register Succes",
        showAlertLoginSucces: false,
        timer: 1500,
      });
    },
    alertRegisterError() {
      this.$swal({
        position: "center",
        icon: "error",
        title: "Register Failed, Fill in The Form !!!",
        showAlertLoginError: false,
        timer: 1500,
      });
    },
  },
};
</script>

<style></style>
