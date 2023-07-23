import express from "express";

import { getAllOrder } from "../controllers/order.js";

const router = express.Router();

router.get("/orders", getAllOrder);

export default router;
