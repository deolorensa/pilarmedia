import express from "express";
import dotenv from "dotenv";
import cookieParser from "cookie-parser";
import cors from "cors";
import db from "./config/Database.js";
import guestRouter from "./routes/guestRouter.js";
import authRouter from "./routes/authRouter.js";
import orderRouter from "./routes/orderRouter.js";
dotenv.config();
const app = express();

try {
  await db.authenticate();
  console.log("Database connected...");
} catch (error) {
  console.error("Connection error:", error);
}

app.use(cors());
app.use(cookieParser());
app.use(express.json());
app.use(orderRouter);
app.use(authRouter);
app.use(guestRouter);

app.listen(3000, () => console.log("Server running at port 3000"));
