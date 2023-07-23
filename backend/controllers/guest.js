import Guest from "../models/guestModel.js";

export const getAllGuests = async (req, res) => {
  try {
    const guests = await Guest.findAll();
    res.json(guests);
  } catch (error) {
    res.json({ message: error.message });
  }
};

export const getGuestById = async (req, res) => {
  try {
    const guest = await Guest.findAll({
      where: {
        id: req.params.id,
      },
    });
    res.json(guest[0]);
  } catch (error) {
    res.json({ message: error.message });
  }
};

export const createGuest = async (req, res) => {
  try {
    await Guest.create(req.body);
    res.json({
      message: "Guest Created",
    });
  } catch (error) {
    res.json({ message: error.message });
  }
};

export const updateGuest = async (req, res) => {
  try {
    await Guest.update(req.body, {
      where: {
        id: req.params.id,
      },
    });
    res.json({
      message: "Guest Updated",
    });
  } catch (error) {
    res.json({ message: error.message });
  }
};

export const deleteGuest = async (req, res) => {
  try {
    await Guest.destroy({
      where: {
        id: req.params.id,
      },
    });
    res.json({
      message: "Guest Deleted",
    });
  } catch (error) {
    res.json({ message: error.message });
  }
};

export const deleteGuestFifo = async (req, res) => {
  try {
    const guest = await Guest.findOne({
      order: [["createdAt", "ASC"]],
    });
    await guest.destroy();
    res.json({
      message: "Guest Deleted",
    });
  } catch (error) {
    res.json({ message: error.message });
  }
};
export const deleteGuestLifo = async (req, res) => {
  try {
    const guest = await Guest.findOne({
      order: [["createdAt", "DESC"]],
    });
    await guest.destroy();
    res.json({
      message: "Guest Deleted",
    });
  } catch (error) {
    res.json({ message: error.message });
  }
};
