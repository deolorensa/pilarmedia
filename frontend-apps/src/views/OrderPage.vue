<template>
  <div class="container mx-auto">
    <div class="border-b shadow-2xl">
      <NavbarMain />
    </div>
    <div class="flex m-20">
      <table class="w-full text-sm text-left text-gray-500">
        <thead
          class="text-md text-gray-700 uppercase bg-emerald-50 text-center"
        >
          <tr>
            <th scope="col" class="py-3 px-6">ID Order</th>
            <th scope="col" class="py-3 px-6">ID Pengirim</th>
            <th scope="col" class="py-3 px-6">ID Penerima</th>
            <th scope="col" class="py-3 px-6">Alamat</th>
            <th scope="col" class="py-3 px-6">Priority</th>
          </tr>
        </thead>
        <tbody v-if="orders.length">
          <tr
            v-for="(order, index) in orders"
            :key="index"
            class="bg-white border-b hover:bg-gray-50 text-center"
          >
            <td class="py-4 px-6">
              {{ order.id_order }}
            </td>
            <td class="py-4 px-6">PJ0{{ order.id_pengirim }}</td>
            <td class="py-4 px-6">CS0{{ order.id_penerima }}</td>
            <td class="py-4 px-6">
              {{ order.alamat }}
            </td>
            <td class="py-4 px-6">
              {{ order.priority }}
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
  </div>
</template>

<script>
import NavbarMain from "@/components/NavbarMain.vue";
export default {
  components: { NavbarMain },
  data() {
    return {
      searchQuery: null,
    };
  },
  mounted() {
    this.getOrder();
  },
  methods: {
    async getOrder() {
      await this.$store.dispatch("getOrders");
    },
  },
  computed: {
    orders() {
      return this.$store.state.orders;
    },
  },
};
</script>

<style></style>
