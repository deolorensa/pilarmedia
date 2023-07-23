import Vue from "vue";
import VueRouter from "vue-router";
import store from "../store";
import HomeView from "../views/HomeView.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "home",
    component: HomeView,
    meta: { requiresAuth: true },
  },
  {
    path: "/register",
    name: "register",
    component: () => import("../views/auth/RegisterView.vue"),
    meta: { requiresAuth: false },
  },
  {
    path: "/login",
    name: "login",
    component: () => import("../views/auth/LoginView.vue"),
    meta: { requiresAuth: false },
  },
  {
    path: "/notfound",
    name: "notfound",
    component: () => import("../views/auth/NotFound.vue"),
    meta: { requiresAuth: false },
  },
  {
    path: "/addguest",
    name: "addguest",
    component: () => import("../views/AddGuest.vue"),
    meta: { requiresAuth: true },
  },
  {
    path: "/orderpage",
    name: "orderpage",
    component: () => import("../views/OrderPage.vue"),
    meta: { requiresAuth: true },
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});
router.beforeEach((to, _, next) => {
  if (to.name == "login" && store.state.token) {
    next({
      name: "home",
    });
  }
  if (to.matched.length == 0) {
    next({
      name: "notfound",
    });
  }
  // instead of having to check every route record with
  // to.matched.some(record => record.meta.requiresAuth)
  if (to.meta.requiresAuth && !store.state.token) {
    // this route requires auth, check if logged in
    // if not, redirect to login page.
    next({
      name: "login",
    });
  }
  next();
});

export default router;
