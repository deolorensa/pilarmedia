<template>
  <div class="w-full">
    <div class="m-5">
      <div class="flex" aria-label="Breadcrumb">
        <ol class="inline-flex items-center space-x-1 md:space-x-3">
          <li class="inline-flex items-center">
            <router-link
              to="/"
              class="inline-flex items-center text-lg font-bold text-gray-700 hover:text-emerald-600"
            >
              Home
            </router-link>
          </li>
          <li aria-current="page">
            <div class="flex items-center">
              <svg
                class="w-6 h-6 text-gray-800"
                fill="currentColor"
                viewBox="0 0 20 20"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  fill-rule="evenodd"
                  d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                  clip-rule="evenodd"
                ></path>
              </svg>
              <span class="ml-1 text-lg font-bold text-emerald-600 md:ml-2"
                >Add Guest</span
              >
            </div>
          </li>
        </ol>
      </div>
    </div>
    <div class="m-5">
      <router-link to="/">
        <button
          class="border border-2 border-black rounded-full p-2 hover:bg-emerald-100"
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            class="h-6 w-6"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
            stroke-width="2"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              d="M15 19l-7-7 7-7"
            />
          </svg>
        </button>
      </router-link>
    </div>
    <div class="m-5">
      <form
        @submit="uploadGuest()"
        action="/"
        class="border max-w-xl border-2 border-emerald-600 rounded-xl p-5"
      >
        <p class="text-lg font-bold text-emerald-600 mb-6">Add Guest</p>
        <div class="mb-6">
          <label
            for="title"
            class="block mb-2 text-sm font-medium text-gray-900"
            >ID Card Number</label
          >
          <input
            v-model="card"
            type="number"
            id="title"
            min="1"
            class="shadow-sm bg-gray-50 border border-2 border-emerald-200 text-gray-900 text-sm rounded-lg hover:bg-emerald-100 focus:ring-emerald-600 focus:border-emerald-600 block w-full p-2.5"
            placeholder="123812414 ..."
            required
          />
        </div>
        <div class="mb-6">
          <label for="name" class="block mb-2 text-sm font-medium text-gray-900"
            >Name</label
          >
          <input
            v-model="name"
            type="text"
            id="name"
            minlength="1"
            class="shadow-sm bg-gray-50 border border-2 border-emerald-200 text-gray-900 text-sm rounded-lg hover:bg-emerald-100 focus:ring-emerald-600 focus:border-emerald-600 block w-full p-2.5"
            placeholder="Name ..."
            required
          />
        </div>
        <div class="mb-6">
          <label
            for="email"
            class="block mb-2 text-sm font-medium text-gray-900"
            >Email</label
          >
          <input
            v-model="email"
            type="email"
            id="email"
            minlength="1"
            class="shadow-sm bg-gray-50 border border-2 border-emerald-200 text-gray-900 text-sm rounded-lg hover:bg-emerald-100 focus:ring-emerald-600 focus:border-emerald-600 block w-full p-2.5"
            placeholder="name@mail.com"
            required
          />
        </div>
        <div class="mb-6">
          <label for="date" class="block mb-2 text-sm font-medium text-gray-900"
            >Date of Birthday</label
          >
          <input
            v-model="birth"
            type="date"
            id="date"
            minlength="1"
            class="shadow-sm bg-gray-50 border border-2 border-emerald-200 text-gray-900 text-sm rounded-lg hover:bg-emerald-100 focus:ring-emerald-600 focus:border-emerald-600 block w-full p-2.5"
            required
          />
        </div>
        <div class="flex justify-end">
          <button
            class="p-2.5 px-3 text-sm font-medium text-white bg-emerald-600 rounded border border-emerald-600 hover:bg-emerald-100 hover:text-emerald-600"
            type="submit"
          >
            Upload Guest
          </button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      name: null,
      email: null,
      card: null,
      birth: null,
    };
  },
  methods: {
    uploadGuest() {
      axios
        .post(`http://localhost:3000/guests`, {
          name: this.name,
          email: this.email,
          birth: this.birth,
          card: this.card,
        })
        .then((response) => {
          this.alertAddGuestSucces();
          this.$store.commit("setGuests", response.data);
          this.$router.replace({ name: "home" });
        })
        .catch((error) => {
          this.alertAddGuestError(error);
        });
    },
    alertAddGuestSucces() {
      this.$swal({
        position: "center",
        icon: "success",
        title: "Add Guest Succes",
        showAlertLoginSucces: false,
        timer: 1500,
      });
    },
    alertAddGuestError() {
      this.$swal({
        position: "center",
        icon: "error",
        title: "Add Guest Failed, Fill it Properly !!!",
        showAlertLoginError: false,
        timer: 1500,
      });
    },
  },
};
</script>

<style></style>
