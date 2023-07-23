import express from "express";

import {
  getAllGuests,
  createGuest,
  getGuestById,
  updateGuest,
  deleteGuest,
  deleteGuestFifo,
  deleteGuestLifo,
} from "../controllers/guest.js";

const router = express.Router();

router.get("/guests", getAllGuests);
router.get("/guests/:id", getGuestById);
router.post("/guests", createGuest);
router.patch("/guests/:id", updateGuest);
router.delete("/guests/fifo", deleteGuestFifo);
router.delete("/guests/lifo", deleteGuestLifo);
router.delete("/guests/:id", deleteGuest);

export default router;
