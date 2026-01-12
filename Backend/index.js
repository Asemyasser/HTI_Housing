import dotenv from "dotenv";
import express from "express";
import cors from "cors";
import { connectDB } from "./db/connection.js";
import { initApp } from "./src/initApp.js";
dotenv.config();
const app = express();
const port = process.env.PORT || 3000;

app.use(
  cors({ origin: ["https://asemyasser.github.io", "http://localhost:5173"] })
);

connectDB();

initApp(app, express);
app.listen(port, () => console.log(`Example app listening on port ${port}!`));
