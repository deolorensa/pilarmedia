<template>
  <div class="container mx-auto">
    <div class="border-b shadow-2xl">
      <NavbarMain />
    </div>
    <div class="flex justify-end mt-10 mx-20">
      <button
        @click="deleteGuestFifo()"
        class="p-2 bg-green-300 rounded-xl border hover:text-green-300 hover:bg-white hover:border-green-300"
      >
        Fifo
      </button>
      <button
        @click="deleteGuestLifo()"
        class="p-2 bg-green-300 rounded-xl border hover:text-green-300 hover:bg-white hover:border-green-300"
      >
        Lifo
      </button>
      <router-link
        class="w-10 h-10 bg-emerald-700 rounded-full text-white hover:bg-emerald-100 hover:text-emerald-700 text-3xl pl-2.5 pb-3 mx-3"
        to="/addguest"
      >
        +
      </router-link>
      <div class="relative max-w-lg">
        <div
          class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none"
        >
          <svg
            class="w-5 h-5 text-gray-500"
            aria-hidden="true"
            fill="currentColor"
            viewBox="0 0 20 20"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              fill-rule="evenodd"
              d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
              clip-rule="evenodd"
            ></path>
          </svg>
          <span class="sr-only">Search icon</span>
        </div>
        <input
          v-model="searchQuery"
          type="text"
          id="search-navbar"
          class="block p-2 pl-10 w-full text-gray-900 bg-emerald-50 rounded-lg border border-emerald-600 sm:text-sm focus:ring-emerald-200 focus:border-emerald-500"
          placeholder="Search..."
        />
      </div>
    </div>
    <div class="flex m-20">
      <table class="w-full text-sm text-left text-gray-500">
        <thead
          class="text-md text-gray-700 uppercase bg-emerald-50 text-center"
        >
          <tr>
            <th scope="col" class="py-3 px-6">ID Card number</th>
            <th scope="col" class="py-3 px-6">Name</th>
            <th scope="col" class="py-3 px-6">Date of Birthday</th>
            <th scope="col" class="py-3 px-6">Email</th>
            <th scope="col" class="py-3 px-6">Action</th>
          </tr>
        </thead>
        <tbody v-if="resultQuery.length">
          <tr
            v-for="(guest, index) in resultQuery"
            :key="index"
            class="bg-white border-b hover:bg-gray-50 text-center"
          >
            <th
              scope="row"
              class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap"
            >
              {{ guest.card }}
            </th>
            <td class="py-4 px-6">
              {{ guest.name }}
            </td>
            <td class="py-4 px-6">
              {{ guest.birth }}
            </td>
            <td class="py-4 px-6">
              {{ guest.email }}
            </td>
            <td class="py-4 px-6">
              <button
                @click="getEditGuest(guest.id)"
                class="p-2 bg-slate-400 rounded-xl text-white border hover:text-slate-400 hover:bg-white hover:border-slate-400 mr-2"
              >
                Edit
              </button>
              <button
                @click="deleteGuest(guest.id)"
                class="p-2 bg-red-500 border rounded-xl text-white hover:bg-white hover:text-red-500 hover:border-red-500"
              >
                Delete
              </button>
            </td>
          </tr>
        </tbody>
        <tbody v-else>
          <tr
            class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600"
          >
            <th
              scope="row"
              class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white"
            >
              Data Kosong
            </th>
          </tr>
        </tbody>
      </table>
    </div>
    <div class="w-full flex justify-center">
      <form
        @submit.prevent="editGuest(id)"
        v-if="isEdit"
        class="border w-[500px] border-emerald-600 rounded-xl p-5"
      >
        <p class="text-lg font-bold text-emerald-600 mb-6">Edit Guest</p>
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
            class="shadow-sm bg-gray-50 border border-emerald-200 text-gray-900 text-sm rounded-lg hover:bg-emerald-100 focus:ring-emerald-600 focus:border-emerald-600 block w-full p-2.5"
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
            class="shadow-sm bg-gray-50 border border-emerald-200 text-gray-900 text-sm rounded-lg hover:bg-emerald-100 focus:ring-emerald-600 focus:border-emerald-600 block w-full p-2.5"
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
            class="shadow-sm bg-gray-50 border border-emerald-200 text-gray-900 text-sm rounded-lg hover:bg-emerald-100 focus:ring-emerald-600 focus:border-emerald-600 block w-full p-2.5"
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
            class="shadow-sm bg-gray-50 border border-emerald-200 text-gray-900 text-sm rounded-lg hover:bg-emerald-100 focus:ring-emerald-600 focus:border-emerald-600 block w-full p-2.5"
            required
          />
        </div>
        <div class="flex justify-end">
          <button
            class="p-2.5 px-3 text-sm font-medium text-white bg-emerald-600 rounded border border-emerald-600 hover:bg-emerald-100 hover:text-emerald-600"
            type="submit"
          >
            Update Guest
          </button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import NavbarMain from "@/components/NavbarMain.vue";
import axios from "axios";
export default {
  components: { NavbarMain },
  data() {
    return {
      searchQuery: null,
      isEdit: false,
      name: null,
      email: null,
      birth: null,
      card: null,
      id: null,
    };
  },
  mounted() {
    this.getGuest();
  },
  methods: {
    async getGuest() {
      await this.$store.dispatch("getGuest");
    },
    async getEditGuest(index) {
      await axios
        .get("http://localhost:3000/guests/" + index)
        .then((response) => {
          this.isEdit = true;
          this.name = response.data.name;
          this.birth = response.data.birth;
          this.email = response.data.email;
          this.card = response.data.card;
          this.id = response.data.id;
        })
        .catch((error) => {
          this.alertDeleteError(error);
        });
    },
    async editGuest(index) {
      await axios
        .patch("http://localhost:3000/guests/" + index, {
          name: this.name,
          id: this.id,
          card: this.card,
          birth: this.birth,
          email: this.email,
        })
        .then((response) => {
          this.alertEditSucces();
          this.isEdit = false;
          this.getGuest();
          console.log(response);
        })
        .catch((error) => {
          this.alertEditError(error);
        });
    },
    async deleteGuest(index) {
      await axios
        .delete("http://localhost:3000/guests/" + index)
        .then((response) => {
          console.log(response);
          this.alertDeleteSucces();
          this.getGuest();
        })
        .catch((error) => {
          this.alertDeleteError(error);
        });
    },
    async deleteGuestFifo() {
      await axios
        .delete("http://localhost:3000/guests/fifo")
        .then((response) => {
          console.log(response);
          this.alertDeleteSucces();
          this.getGuest();
        })
        .catch((error) => {
          this.alertDeleteError(error);
        });
    },
    async deleteGuestLifo() {
      await axios
        .delete("http://localhost:3000/guests/lifo")
        .then((response) => {
          console.log(response);
          this.alertDeleteSucces();
          this.getGuest();
        })
        .catch((error) => {
          this.alertDeleteError(error);
        });
    },
    alertDeleteSucces() {
      this.$swal({
        position: "center",
        icon: "success",
        title: "Delete Succes",
        showAlertLoginSucces: false,
        timer: 1500,
      });
    },
    alertDeleteError() {
      this.$swal({
        position: "center",
        icon: "error",
        title: "Delete Failed !!!",
        showAlertLoginError: false,
        timer: 1500,
      });
    },
    alertEditSucces() {
      this.$swal({
        position: "center",
        icon: "success",
        title: "Edit Succes",
        showAlertLoginSucces: false,
        timer: 1500,
      });
    },
    alertEditError() {
      this.$swal({
        position: "center",
        icon: "error",
        title: "Edit Failed !!!",
        showAlertLoginError: false,
        timer: 1500,
      });
    },
  },
  computed: {
    guests() {
      return this.$store.state.guests;
    },
    resultQuery() {
      if (this.searchQuery) {
        return this.$store.state.guests.filter((guest) => {
          return this.searchQuery
            .toLowerCase()
            .split(" ")
            .every((v) => guest.name.toLowerCase().includes(v));
        });
      } else {
        return this.guests;
      }
    },
  },
};
</script>

<style></style>
