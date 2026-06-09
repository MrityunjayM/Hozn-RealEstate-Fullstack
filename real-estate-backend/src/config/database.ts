import { Sequelize } from "sequelize-typescript";
import { User } from "../models/User";
import dotenv from "dotenv";

dotenv.config();

export const sequelize = new Sequelize({
  database: process.env.DATABASE_NAME || "real_estate_db",
  username: process.env.DATABASE_USER || "postgres",
  password: process.env.DATABASE_PASSWORD,
  host: process.env.DATABASE_HOST || "127.0.0.1",
  dialect: "postgres",
  models: [User],
});
