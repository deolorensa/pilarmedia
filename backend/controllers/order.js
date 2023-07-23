import Orders from "../models/orderModel.js";

export const getAllOrder = async (req, res) => {
  try {
    const orders = await Orders.findAll({
      attributes: [
        "id_order",
        "id_pengirim",
        "id_penerima",
        "alamat",
        "priority",
      ],
      order: [["priority", "ASC"]],
    });
    res.json(orders);
    console.log(orders);
  } catch (error) {
    res.json({ message: error.message });
  }
};
