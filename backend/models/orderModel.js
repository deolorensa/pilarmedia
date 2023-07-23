import { Sequelize } from "sequelize";
import db from "../config/database.js";

const { DataTypes } = Sequelize;

const Orders = db.define(
  "orders",
  {
    id_order: {
      type: DataTypes.INTEGER,
    },
    id_pengirim: {
      type: DataTypes.INTEGER,
    },
    id_penerima: {
      type: DataTypes.INTEGER,
    },
    alamat: {
      type: DataTypes.STRING,
    },
    priority: {
      type: DataTypes.INTEGER,
    },
  },
  {
    freezeTableName: true,
  }
);

(async () => {
  await db.sync();
})();
export default Orders;
