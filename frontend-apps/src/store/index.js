import Vue from "vue";
import Vuex from "vuex";
import axios from "axios";
import createPersistedState from "vuex-persistedstate";

Vue.use(Vuex);

export default new Vuex.Store({
  plugins: [createPersistedState()],
  state: {
    register: [],
    token: null,
    guests: [],
    orders: null,
  },
  getters: {},
  mutations: {
    loginSucces(state, token) {
      state.token = token;
    },
    SetLogin(state, roles) {
      state.roles = roles;
    },
    setRegister(state, playload) {
      state.register = playload;
    },
    setGuests(state, playload) {
      state.guests = playload;
    },
    setOrders(state, playload) {
      state.orders = playload;
    },
    logout(state) {
      state.token = null;
    },
  },
  actions: {
    getGuest(store) {
      axios
        .get(`http://localhost:3000/guests`)
        .then((response) => {
          store.commit("setGuests", response.data);
        })
        .catch((error) => {
          console.log(error);
        });
    },
    getOrders(store) {
      axios
        .get(`http://localhost:3000/orders`)
        .then((response) => {
          store.commit("setOrders", response.data);
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
  modules: {},
});
