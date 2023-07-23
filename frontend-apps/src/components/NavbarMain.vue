<template>
  <div class="container mx-auto">
    <nav class="bg-white border-gray-200 px-2 sm:px-4 py-2.5">
      <div class="container flex justify-between items-center mx-auto">
        <a href="#" class="flex items-center">
          <img src="../assets/logo-aksesmu.png" class="h-6 sm:h-9" alt="" />
        </a>
        <div class="flex gap-5">
          <router-link
            to="/"
            class="text-xl font-semibold whitespace-nowrap hover:text-emerald-600"
          >
            Guest Book
          </router-link>
          <router-link
            to="/orderpage"
            class="text-xl font-semibold whitespace-nowrap hover:text-emerald-600"
          >
            Order
          </router-link>
        </div>
        <div class="w-auto" id="navbar-default">
          <ul class="flex flex-col md:mt-0 md:text-sm md:font-medium">
            <li>
              <button
                @click="logout()"
                class="block p-2.5 py-2 text-black font-semibold border-b border-gray-100 rounded hover:text-white hover:bg-emerald-600 md:hover:bg-emerald-500 md:border-0 md:hover:text-white"
              >
                Logout
              </button>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </div>
</template>

<script>
import axios from "axios";

export default {
  methods: {
    logoutUser() {
      axios.delete(`http://localhost:5000/logout`).catch((error) => {
        console.log(error);
      });
    },
    logout() {
      this.$swal({
        title: "Logout ?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#d33",
        cancelButtonColor: "#757575",
        confirmButtonText: "Logout",
        cancelButtonText: "cancel",
        closeOnConfirm: true,
        closeOnCancel: true,
      }).then((result) => {
        if (result.value === true) {
          this.alertLogoutSucces();
          this.$store.commit("logout");
          this.logoutUser();
          this.$router.replace({ name: "login" });
        }
      });
    },
    alertLogoutSucces() {
      this.$swal({
        position: "center",
        icon: "success",
        title: "Logout Succes",
        showAlertLogoutSucces: false,
        timer: 1500,
      });
    },
  },
};
</script>

<style></style>
